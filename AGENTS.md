# Repository instructions

- Keep Hyprland monitor settings local to each machine. The tracked
  `hypr/monitors.lua` documents the desktop and is not a shared configuration.
- Pulling this repository does not apply Hyprland settings. When asked to apply
  them, use `hypr/install.sh`; it preserves the target machine's `monitors.lua`
  and backs up files it replaces. Review the other settings for the target
  machine before running it.
- Do not copy, link, or overwrite the active `monitors.lua` with the tracked
  version unless the user explicitly requests a monitor configuration change.
  If the target has no `monitors.lua`, leave monitor setup to the user or follow
  their explicit instructions.
- After applying Hyprland Lua changes, run `hyprctl reload` and
  `hyprctl configerrors` in the target machine's Hyprland session.
