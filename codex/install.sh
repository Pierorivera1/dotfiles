#!/usr/bin/env bash
# Install personal Codex instructions and skills without replacing existing files.
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

link_if_available() {
    local source="$1" destination="$2"

    if [[ -L "$destination" && "$(readlink -f -- "$destination")" == "$source" ]]; then
        printf 'Already linked: %s\n' "$destination"
        return 0
    fi
    if [[ -e "$destination" || -L "$destination" ]]; then
        printf 'Skipped existing path: %s\n' "$destination" >&2
        return 1
    fi
    ln -s -- "$source" "$destination"
    printf 'Linked: %s\n' "$destination"
}

install_all() {
    local codex_dir="$1" skills_dir="$2"
    local source name legacy failed=0

    mkdir -p -- "$codex_dir" "$skills_dir"
    if [[ -f "$SCRIPT_DIR/AGENTS.md" ]]; then
        link_if_available "$SCRIPT_DIR/AGENTS.md" "$codex_dir/AGENTS.md" || failed=1
    else
        printf 'Keeping global instructions local.\n'
    fi

    if [[ ! -e "$codex_dir/config.toml" && ! -L "$codex_dir/config.toml" ]]; then
        cp -- "$SCRIPT_DIR/config.toml" "$codex_dir/config.toml"
        printf 'Created: %s\n' "$codex_dir/config.toml"
    else
        printf 'Kept existing config: %s\n' "$codex_dir/config.toml"
    fi

    for source in "$SCRIPT_DIR"/skills/*; do
        [[ -d "$source" && -f "$source/SKILL.md" ]] || continue
        name="${source##*/}"
        legacy="$codex_dir/skills/$name"

        # Avoid loading two user-level skills with the same name.
        if [[ -L "$legacy" && "$(readlink -f -- "$legacy")" == "$source" ]]; then
            printf 'Already linked: %s\n' "$legacy"
            continue
        fi
        if [[ -e "$legacy" || -L "$legacy" ]]; then
            printf 'Skipped existing skill: %s\n' "$legacy" >&2
            failed=1
            continue
        fi
        link_if_available "$source" "$skills_dir/$name" || failed=1
    done

    if (( failed )); then
        printf 'Some paths already exist. Review them before installing those items.\n' >&2
        return 1
    fi
    printf 'Codex instructions and personal skills are installed.\n'
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    install_all "${CODEX_HOME:-$HOME/.codex}" "$HOME/.agents/skills"
fi
