  Ai Model for Pull request marge
  
  
  
                 +--------------------+
                 |   Developer Push   |
                 |   / Pull Request   |
                 +---------+----------+
                           |
                           v
                 +--------------------+
                 | GitHub Actions     |
                 | Workflow Triggered |
                 +---------+----------+
                           |
                           v
                 +--------------------+
                 | Checkout Code      |
                 | Set up Python      |
                 | Install Dependencies|
                 +---------+----------+
                           |
                           v
                 +--------------------+
                 | Run Python Script  |
                 | scripts/ai_merge_pr.py |
                 +---------+----------+
                           |
             +-------------+----------------+
             |                              |
             v                              v
   +--------------------+          +--------------------+
   | Merge Successful   |          | Merge Conflicts    |
   | - Commit merge     |          | - Detect conflicted|
   | - Comment PR: ✅    |          |   files            |
   +--------------------+          +--------------------+
                                            |
                                            v
                                 +--------------------+
                                 | Send conflict files|
                                 | to OpenAI          |
                                 | for resolution     |
                                 +--------------------+
                                            |
                                            v
                                 +--------------------+
                                 | Post AI suggestions|
                                 | as PR comment      |
                                 +--------------------+
                                            |
                                            v
                                 +--------------------+
                                 | Merge Aborted      |
                                 | (manual review)    |
                                 +--------------------+
