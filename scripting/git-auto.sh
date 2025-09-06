#!/bin/bash
# ⚙️ Git Repo Setup Script - with optional commit, remote, and push

echo "Enter project name:"
read project

mkdir -p "$project"
cd "$project" || exit

echo "Initializing Git repository..."
git init > /dev/null

# Create README
echo "# $project" > README.md

# Ask if user wants to make the first commit
echo "Do you want to make the initial commit? (y/n)"
read commit_choice

if [[ $commit_choice == "y" || $commit_choice == "Y" ]]; then
    git add README.md
    git commit -m "Initial commit with README" > /dev/null
    echo "Initial commit created!"
else
    echo "Skipped initial commit."
fi

# Ask if user wants to add remote repository
echo "Do you want to add a remote repository? (y/n)"
read remote_choice

if [[ $remote_choice == "y" || $remote_choice == "Y" ]]; then
    echo "Enter remote repository URL (e.g. https://github.com/user/repo.git):"
    read remote_url
    git remote add origin "$remote_url"
    echo "Remote repository added: $remote_url"

    # Ask if user wants to push
    echo "Do you want to push to remote now? (y/n)"
    read push_choice

    if [[ $push_choice == "y" || $push_choice == "Y" ]]; then
        git branch -M main
        git push -u origin main
        echo "Project pushed to remote: $remote_url"
    else
        echo ️"Skipped pushing to remote."
    fi
fi

echo "Project '$project' setup completed!"
git status

