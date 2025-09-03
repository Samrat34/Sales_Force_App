import git
import os
import openai

# Set OpenAI API key
openai.api_key = os.environ.get("OPENAI_API_KEY")

# Open repo
repo = git.Repo(".")

# Get latest 5 commits from develop branch
commits = list(repo.iter_commits('develop', max_count=5))

print("Analyzing latest commits with AI...\n")

for commit in commits:
    message = commit.message
    response = openai.ChatCompletion.create(
        model="gpt-4o-mini",
        messages=[
            {"role": "user", "content": f"Analyze this commit message for quality, clarity, and potential conflicts: {message}"}
        ]
    )
    analysis = response['choices'][0]['message']['content']
    print(f"Commit: {commit.hexsha}\nAnalysis:\n{analysis}\n{'-'*50}")

# TODO: Add automatic merge or conflict resolution logic
