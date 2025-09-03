import os
import openai
from github import Github
import git

# Set OpenAI API key
openai.api_key = os.environ.get("OPENAI_API_KEY")
github_token = os.environ.get("GITHUB_TOKEN")

# Get PR info from environment (GitHub Actions provides these)
pr_number = int(os.environ.get("GITHUB_REF").split("/")[-1])
repo_name = os.environ.get("GITHUB_REPOSITORY")

# Connect to GitHub
g = Github(github_token)
repo = g.get_repo(repo_name)
pr = repo.get_pull(pr_number)

# Open local git repo
local_repo = git.Repo(".")

# Branches
source_branch = pr.head.ref
target_branch = pr.base.ref

# Checkout target branch
local_repo.git.checkout(target_branch)
local_repo.git.pull()

try:
    local_repo.git.merge(source_branch, "--no-commit", "--no-ff")
    pr.create_issue_comment(f"✅ Branch `{source_branch}` merged into `{target_branch}` without conflicts.")
    local_repo.git.commit("-m", f"AI merge: {source_branch} → {target_branch}")
except git.exc.GitCommandError as e:
    conflict_files = local_repo.index.unmerged_blobs().keys()
    comments = "⚠️ Conflicts detected during merge. AI suggestions:\n\n"
    for file in conflict_files:
        with open(file, "r", encoding="utf-8", errors="ignore") as f:
            content = f.read()
        response = openai.ChatCompletion.create(
            model="gpt-4o-mini",
            messages=[
                {"role": "user",
                 "content": f"Suggest a safe resolution for this merge conflict in {file}:\n\n{content}"}
            ]
        )
        suggestion = response['choices'][0]['message']['content']
        comments += f"**File:** `{file}`\n```\n{suggestion}\n```\n"
    pr.create_issue_comment(comments)
    local_repo.git.merge("--abort")
