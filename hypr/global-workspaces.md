# Global workspaces

Personal override for Omarchy 4.5, installed on 2026-11-05.

`hyprland.lua` loads `hypr.global-workspaces` after the packaged defaults. This disables the default workspace manager's reconciliation and replaces workspace shortcuts with global numbers. Super+number focuses that workspace on whichever monitor owns it. Super+Tab cycles existing workspaces across monitors.

The local `pierooo.workspaces` bar plugin shows global workspace numbers on both monitors. Its source is in `~/.config/omarchy/plugins/pierooo.workspaces/Workspaces.qml`.

Verified with simulated keyboard input through a temporary uinput device: Super+1 focused DVI, Super+2 focused HDMI, and Super+Tab crossed monitors. Workspace numbers also survived a Hyprland reload without config errors. Physical monitor unplug/replug was not tested.

The override uses Omarchy's `o.workspaces` API. Recheck it if a future update changes that API. Timestamped backups of hyprland.lua, bindings.lua, and shell.json were saved beside those files before the changes.
