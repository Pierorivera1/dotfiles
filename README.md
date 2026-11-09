# Personal dotfiles

My Codex settings, installed skills, and Hyprland configuration.

## Install

On Linux, clone this repository to `~/dotfiles` and run:

```bash
bash ~/dotfiles/codex/install.sh
```

The installer links every skill folder in `codex/skills/` to `~/.agents/skills/`.
Codex reads that location. Existing skills with the same names are kept and reported
instead of being overwritten. Review those conflicts and rerun the installer.
The installer uses `CODEX_HOME` for the Codex directory when it is set.

On a fresh machine, the installer copies `codex/config.toml` to
`~/.codex/config.toml`. When a config already exists, it leaves it untouched.
Merge selected settings manually if you want them on that machine. Codex may
also write machine-specific settings to its active config, so it is not linked.

## Skills

Create personal skills in `~/dotfiles/codex/skills/<skill-name>/`, including a
`SKILL.md` file. Run the installer after adding a skill. It discovers all skill
folders there without a list of names. Changes to an already linked skill are
visible through its active path. Restart Codex if a skill does not appear.

Git pull updates the repository, including linked skills. Run the installer
again after pulling newly added skills. Skills already installed under other
names stay untouched. Review same-name conflicts before making changes.

The repository also includes four frontend skills:

- `design-taste-frontend`: design and review websites.
- `frontend-design`: develop a distinct visual direction for an interface.
- `impeccable`: design, audit, and improve frontend interfaces.
- `unslop`: improve the visual design of an existing interface.

Existing installed copies are preserved by the installer. A separate copy does
not receive updates made to the repository. Check both `~/.agents/skills/` and
`~/.codex/skills/` for same-name copies before resolving a conflict. If both
locations contain a skill with the same name, Codex may list it twice.

The personal skills are:

- `in-your-own-words`: restate the user's goal. Invoke with `$in-your-own-words`.
- `no-slop`: edit prose while preserving meaning and voice. Invoke with `$no-slop`.
- `interview`: develop an implementation-ready specification through questions.
  Invoke with `$interview` or request an interview about a project or feature.
- `readmesito`: create or update a project README based on repository evidence.
- `grill-me`: invoke the separately installed `grilling` skill to challenge a
  plan or design. This repository does not include `grilling`, so this requires
  a compatible installation of that skill and a runtime that can invoke it.

## Settings and instructions

Global instructions in `~/.codex/AGENTS.md` remain local. A local
`codex/AGENTS.md` is ignored by Git. To share config changes, edit the
corresponding portable settings in
`~/dotfiles/codex/config.toml` as well as the active config. The repository
contains reasoning, terminal, feature, and desktop preferences. Choose a model
in Codex on each machine.

Credentials, sessions, plugin caches, project trust entries, local browser
integration, and hook trust state stay outside this repository. The hooks
feature flag does not install hook definitions. Herdr settings remain
machine-specific.

## Hyprland

The `hypr/` directory contains the active Omarchy 4.5 configuration, including
personal shortcuts, global workspace behavior, appearance, and lock and idle
settings. Super+S toggles the scratchpad. Its background dimming follows the
Omarchy default.

These files are a snapshot. Pulling the repository does not change the active
Hyprland config. To apply the settings on another Omarchy machine, run:

```bash
bash ~/dotfiles/hypr/install.sh
hyprctl reload
hyprctl configerrors
```

The installer backs up existing files before replacing them. It always keeps the
machine's own `monitors.lua`, and stops if that file is missing. The tracked
`monitors.lua` records this desktop's configuration for reference. Other settings,
including keyboard input and idle behavior, are copied from this desktop, so
review them before installing. Run the installer again after pulling changes;
the files are copied, not linked. The global workspace override depends on
Omarchy internals and may need adjustment after updates. The optional custom
workspace bar plugin is not included.

## References

- [Codex configuration](https://learn.chatgpt.com/docs/config-file/config-basic)
- [Local skills](https://learn.chatgpt.com/docs/build-skills)
