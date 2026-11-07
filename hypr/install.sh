#!/usr/bin/env bash
set -euo pipefail

source_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
target_dir="${XDG_CONFIG_HOME:-$HOME/.config}/hypr"
files=(hyprland.lua bindings.lua global-workspaces.lua looknfeel.lua input.lua
       autostart.lua hypridle.conf hyprlock.conf hyprsunset.conf xdph.conf)

if [[ ! -f "$target_dir/monitors.lua" ]]; then
    printf 'No local monitors.lua at %s. Configure monitors first.\n' "$target_dir" >&2
    exit 1
fi

for name in "${files[@]}"; do
    if [[ ! -f "$source_dir/$name" || -L "$target_dir/$name" || ( -e "$target_dir/$name" && ! -f "$target_dir/$name" ) ]]; then
        printf 'Cannot safely install %s. Check source and destination.\n' "$name" >&2
        exit 1
    fi
done

backup_dir="$(mktemp -d "${target_dir}/backup-dotfiles.XXXXXXXX")"
for name in "${files[@]}"; do
    if [[ -f "$target_dir/$name" ]]; then
        cp -p -- "$target_dir/$name" "$backup_dir/$name"
    fi
done
for name in "${files[@]}"; do
    cp -- "$source_dir/$name" "$target_dir/$name"
done

printf 'Installed Hyprland settings. Backups: %s\n' "$backup_dir"
printf 'Kept local monitor settings: %s/monitors.lua\n' "$target_dir"
printf 'Run hyprctl reload and hyprctl configerrors to validate.\n'
