#! /usr/bin/env bash

# Function to get the current Git branch
function parse_git_branch {
    inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
    if [ -z "$inside_git_repo" ]; then
        return
    fi
    branch=$(git branch --show-current)
    if [ -z "$branch" ]; then
        branch=$(git rev-parse --short HEAD)
    fi

    if [ -z "$branch" ]; then
        echo ""
    else
        echo "($branch)"
    fi
}
#TODO: requires coreutils package to be installed - try to handle it later
function get_relative_path {
    grealpath --relative-to="$HOME" "$(pwd)"
}

# Define color codes
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
YELLOW="\[\033[0;33m\]"
NO_COLOR="\[\033[0m\]"

# Set the PS1 variable to customize the prompt
export PS1="${BLUE}\h${NO_COLOR}:${YELLOW}~/\$(get_relative_path)${NO_COLOR}${RED} \$(parse_git_branch)${NO_COLOR}$ "