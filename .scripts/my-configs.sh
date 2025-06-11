#!/bin/bash

# script to copy desired dotfiles to/from github provided their paths as well
# files will be given names as they are in on system (string after last "/" in path")

FILES_PATH=(
	"$HOME/.bashrc"
	"$HOME/.vimrc"
	"$HOME/.tmux.conf"
	"$HOME/.config/starship.toml"
	)
DIRS_PATH=(
	"$HOME/.bashrc.d"
	"$HOME/.config/alacritty"
	"$HOME/.scripts"
)

GIT_REPO="$HOME/forked/dotfiles"

# Create the directory if it doesn't exist

##############################

# if the directory of git repo doesnt exist, create it and clone
init_git_dir(){
	if [ -d "$GIT_REPO" ] && [ "$(ls -A "$GIT_REPO")" ]; then
		echo "$GIT_REPO directory already exists, all good"
	else
		echo "Initializing $GIT_REPO"
		mkdir -p $GIT_REPO 
		git clone "git@github.com:gauron99/dotfiles" $GIT_REPO
		echo "repo init done"
	fi
}

# Function to copy and rename dotfiles
copy_files(){
	for file in "${FILES_PATH[@]}"; do
    base_name=$(basename "$file")
        
    # Copy the file to the GitHub repository directory
    cp "$file" "$GIT_REPO/$base_name"
   	echo "Copied $file to $GIT_REPO/$base_name"
	done	
}

# Function to copy directories and handle dotfiles within them
copy_directories(){
	for dir in "${DIRS_PATH[@]}"; do
		# Create corresponding directory structure in the GitHub repository
		dest_dir="$GIT_REPO/$(basename "$dir")"
		mkdir -p "$dest_dir"
		find "$dir" -type f | while read -r file; do
   		rel_path="${file#$dir/}"
    	base_name=$(basename "$rel_path")

    	# Create necessary directories in the destination
    	sub_dir=$(dirname "$rel_path")
    	mkdir -p "$dest_dir/$sub_dir"

    	# Copy the file
    	cp "$file" "$dest_dir/$sub_dir/$base_name"
    	echo "Copied $file to $dest_dir/$sub_dir/$base_name"
    done
  done
}

# copy files from system given their paths to git controlled dir 
function copy_to_git_dir(){
	init_git_dir
	copy_files
	copy_directories
}


# redistribute files from git dir to the system (create paths where necessary etc.)
#function copy_to_system(){

#}

# Function to commit and push changes to GitHub
sync_to_github() {
    cd "$GIT_REPO" || exit
		if [ "$1" == "all" ];then
			git add .
		else
    	git add -u
		fi
		git status
    git commit -m "Automatic update"
    git push
}

# function will rebase changes from github
sync_from_github() {
    cd "$GIT_REPO" || exit
    git pull origin main
}

# Command parser function
parser() {
    case "$1" in
        upload|send)
						copy_to_git_dir
            sync_to_github "$2"
            ;;
        fetch|get)
            sync_from_github
            ;;
        *)
            echo "Usage: $0 {upload|send|fetch|get}"
            exit 1
            ;;
    esac
}


main(){

	# DON'T source this file
	# rather execute it instead './my-configs.sh'
	if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "This script should NOT be sourced but executed instead."
    exit 1
	fi
	parser "$@"
}


main "$@"
