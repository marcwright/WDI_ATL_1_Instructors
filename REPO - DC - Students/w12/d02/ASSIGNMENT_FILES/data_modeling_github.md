## Data Modeling GitHub

All course long, we've been using a service called GitHub, but as of rather recently, that service didn't exist and someone just like you had to build it. Imagine you're building GitHub and you have to build out the data model, accounting for all of the following specs.

#### Specifications
- A user can create a repo
- A user can add other users to a repo
- A user can watch a repo
- A user can star a repo
- A user can "fork" another person's repo, creating an entirely new repo for them to work on

- Each repo has a master branch and any number of other branches
- Any given branch can have any number of commits
- A given commit has an author
- A given commit can have a parent commit, or in the case of a merge commit, TWO parent commits (one from each branch)
- A given commit has one to many directories
- A given directory belonging to a specific commit may have a parent directory (in the case of the root directory, there is no parent)
- Any given directory will track changes to individual files. Git refers to these changed files as blobs.

- After making changes to a 'forked' repo, a user can propose that those changes are merged onto a specific branch on the original repo via something called a pull request.

- A user can make line-specific comments for a pull request
- A user can follow other users and be followed by many users




