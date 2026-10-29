# Personal dotfiles

My Codex settings and personal skills. The `codex/` directory
contains the files I manage with Git.

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

The personal skills are:

- `in-your-own-words`: restate the user's goal. Invoke with `$in-your-own-words`.
- `unslop`: edit prose while preserving meaning and voice. Invoke with `$unslop`.
- `interview`: develop an implementation-ready specification through questions.
  Invoke with `$interview` or request an interview about a project or feature.

## Settings and instructions

Global instructions in `~/.codex/AGENTS.md` remain local. A local
`codex/AGENTS.md` is ignored by Git. To share config changes, edit the
corresponding portable settings in
`~/dotfiles/codex/config.toml` as well as the active config. The repository
contains reasoning, terminal, feature, and desktop preferences. Choose a model
in Codex on each machine.

Credentials, sessions, plugin caches, project trust entries, local browser
integration, and hook trust state stay outside this repository. The hooks
feature flag does not install hook definitions. Hyprland and herdr settings
remain machine-specific.

## References

- [Codex configuration](https://learn.chatgpt.com/docs/config-file/config-basic)
- [Local skills](https://learn.chatgpt.com/docs/build-skills)
