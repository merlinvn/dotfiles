# Shell configuration

Shared shell configuration for Bash and Zsh across macOS and Linux.

The goal is to keep the common shell environment portable, while isolating shell-specific, platform-specific, and machine-specific behavior.

## Structure

```text
~/.config/shell/
├── env.sh
├── path.sh
├── functions.sh
├── aliases.sh
├── interactive.sh
│
├── platform/
│   ├── darwin.sh
│   └── linux.sh
│
├── tools/
│   ├── common.sh
│   ├── bash.sh
│   └── zsh.sh
│
├── bash/
│   └── init.sh
│
├── zsh/
│   └── init.sh
│
└── local.sh
```

## Responsibilities

### `env.sh`

Shared environment variables.

Examples:

```sh
EDITOR
VISUAL
PAGER
LANG
XDG_*
```

Keep this file shell-agnostic and preferably POSIX-compatible.

Do not put aliases, prompt configuration, or shell-specific syntax here.

---

### `path.sh`

Shared `PATH` configuration.

Examples:

```text
~/.local/bin
~/.cargo/bin
~/bin
```

Avoid adding shell-specific integrations here.

Tool managers such as `mise` should normally manage their own runtime paths from the shell-specific tool integration.

---

### `functions.sh`

Functions shared between Bash and Zsh.

Examples:

```text
has
mkcd
nvims
dipa
```

Keep shared functions portable where practical.

---

### `aliases.sh`

Aliases shared between Bash and Zsh.

Examples:

```text
navigation
git
eza
editors
task runners
```

Aliases may be enabled conditionally using `has`:

```sh
has nvim && alias n='nvim'
```

Avoid putting functions in this file.

---

### `interactive.sh`

Entry point for common interactive-shell configuration.

Typically loads:

```text
functions.sh
aliases.sh
platform/*
tools/common.sh
```

This file should contain orchestration rather than large amounts of configuration.

---

## Platform-specific configuration

### `platform/darwin.sh`

macOS-specific behavior.

Examples:

```text
Homebrew bootstrap
BSD-specific aliases
macOS paths
```

### `platform/linux.sh`

Linux-specific behavior.

Examples:

```text
GNU-specific aliases
dircolors
Linux-only environment setup
```

Prefer feature detection over OS detection when possible.

For example, prefer:

```sh
if command -v tool >/dev/null 2>&1; then
    ...
fi
```

instead of checking the OS unless behavior genuinely differs by platform.

---

## Tool integration

### `tools/common.sh`

Tool configuration shared between Bash and Zsh.

Examples:

```text
FZF_DEFAULT_OPTS
OpenKnowledge environment
shared tool environment variables
```

### `tools/bash.sh`

Bash-specific tool integration.

Examples:

```sh
eval "$(mise activate bash)"
eval "$(starship init bash)"
eval "$(fzf --bash)"
```

### `tools/zsh.sh`

Zsh-specific tool integration.

Examples:

```zsh
eval "$(mise activate zsh)"
eval "$(starship init zsh)"
source <(fzf --zsh)
```

Tool availability should normally be detected dynamically.

---

## Bash

### `bash/init.sh`

Bash-specific interactive configuration.

Examples:

```text
shopt
Bash history
Bash completion
prompt
tools/bash.sh
```

The top-level `~/.bashrc` should stay small and delegate configuration here.

---

## Zsh

### `zsh/init.sh`

Zsh-specific interactive configuration.

Examples:

```text
setopt
Zsh history
Oh My Zsh
completion
tools/zsh.sh
```

The top-level `~/.zshrc` should stay small and delegate configuration here.

---

## Machine-specific configuration

### `local.sh`

Optional configuration for a specific machine.

This file should not be committed.

Examples:

```text
host-specific paths
workstation-only tools
server-only environment
temporary overrides
```

Recommended `.gitignore` entry:

```gitignore
shell/.config/shell/local.sh
```

Disposable VPS, VM, and LXC instances should normally use `local.sh` rather than adding hostname-specific configuration to the repository.

---

## Loading model

Common login environment:

```text
.profile
  ├── env.sh
  └── path.sh
```

Bash interactive shell:

```text
.bashrc
  └── bash/init.sh
    └── tools/bash.sh
  └── interactive.sh
        ├── functions.sh
        ├── platform/*
        ├── tools/common.sh
        └──  aliases.sh
```

Zsh interactive shell:

```text
.zshrc
  └── zsh/init.sh
    └── tools/zsh.sh
  └── interactive.sh
        ├── functions.sh
        ├── platform/*
        ├── tools/common.sh
        └── aliases.sh
```

Login shells should use `.profile` as the shared environment source.

For Zsh, `.zprofile` may source `.profile`.

For Bash, `.bash_profile` may source `.profile` and `.bashrc`.

---

## Design rules

1. Keep shared configuration portable between Bash and Zsh.
2. Keep top-level dotfiles small.
3. Prefer feature detection with `command -v`.
4. Use OS-specific files only when behavior genuinely differs.
5. Keep aliases and functions separate.
6. Keep environment variables and `PATH` separate.
7. Keep shell integrations inside Bash/Zsh-specific files.
8. Keep machine-specific settings out of the repository.
9. Avoid duplicate initialization across `.profile`, `.bashrc`, and `.zshrc`.
10. Prefer simple shell code over clever abstractions.

## Deployment

This directory is managed through GNU Stow as part of the `shell` package.

Typical setup:

```sh
git clone <dotfiles-repository> "$HOME/.dotfiles"

cd "$HOME/.dotfiles"
stow shell
```

The same package should work on:

```text
macOS
Linux workstations
VPS
VMs
LXC containers
SBCs
```

with Bash or Zsh as the interactive shell.
