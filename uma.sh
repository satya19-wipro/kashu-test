#!/bin/bash

# Define the source repositories and target repository

# List of repositories to clone
source_repos=(
    "git@github.com:manoj5606/maven-web-application.git"
    "git@github.com:manoj5606/Facebook-for-manoj.git"

)

#target repository

target_repo="git@github.com:satya19-wipro/kashu-test.git"

#Loop through each sorce repository

for repo in "${source_repos[@]}"; do
    #clone the source repository
    #mkdir "$source_repos[@]"
    git clone "$repo" #${source_repos[@]}
    pwd
    git remote -v
    ls
    #change directory to the cloned repository
    cd "$repo"
    #cd ${source_repos[@]} || exit

    git pull origin master
    ls
    #Add the target repository as a remote
    
    git remote add target-url "$target_repo"
    git add .
    git commit -m "new commit"
    git fetch target-url master
    git pull target-url master
    #git pull --ff-only
    
    #git merge target-url/master --allow-unrelated-histories
    #push changes to the target repository
    
    git push target-url master

    #navigate back to the original directory
    #rm -rf temp_repo
    cd ..
    #git remote target-url master

    echo "current dir ls"
    ls
    #rm -rf temp_repo
done

# Clean up temporary directory

#rm -rf $temp_repo

#echo "All repositories copied to target repository."
