#! /usr/bin/env bash

alias copyconfig='cp ~/configs/config.json . && echo "Configuration copied successfully"'

alias codesigndebug='codesign -s - -v -f --entitlements debug.plist /path/to/your/executable'
codesign_debug() {
    local executable_path="$1"
    local script_dir
    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    codesign -s - -v -f --entitlements "$script_dir/debug.plist" "$executable_path"
}