#! /usr/bin/env bash
echo "bashrc sourced"

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)";
prompt_script="$script_dir/prompt.sh"
customcommands_script="$script_dir/customcommands.sh"

# shellcheck source=prompt.sh
source "$prompt_script"

# shellcheck source=customcommands.sh
source "$customcommands_script"