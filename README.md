## dotfiles
- [vimrc](vimrc): Vim settings
- [nvim](nvim): Neovim config (`init.lua` and any future `lua/`, `after/`, etc.). `setup.sh` links `~/.config/nvim` to this directory (same idea as `vimrc`, but Neovim uses the XDG config path).
- [bashrc](bashrc): Bashrc file
- [setup.sh](setup.sh): Setup file for installation and backup of current configs

## New machine setup checklist
1. Install Homebrew (see below), then clone this repo (e.g. to `~/code/dotfiles`).
2. Run `./setup.sh` — installs required CLI tools (go, bazelisk, buildozer, lcov, fzf, gh,
   sshpass, sshuttle) via Homebrew, symlinks `vimrc`/`bashrc` into place, and installs
   vim-go's Go tool dependencies (gopls, dlv, etc.). `tmux`/`neovim` configs are only linked
   if those tools are already installed — `brew install tmux neovim` first if you want them.
3. Recreate `~/.bash_profile` manually. It is **not** tracked in this repo since it holds
   real credentials/tokens — restore it from your own backup/password manager.
4. Set your global git identity (not restored by `setup.sh`):
   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "you@example.com"
   ```
5. If you use a GitHub Enterprise instance in addition to github.com, authenticate `gh`
   against it: `gh auth login --hostname <your-enterprise-host>`.
6. Make Homebrew's bash your default shell (see below) — note that macOS's own `/etc/paths`
   puts `/usr/bin:/bin` ahead of `/opt/homebrew/bin`, so `which bash` still resolves to the
   old system bash unless you explicitly prepend `/opt/homebrew/bin` to `PATH` in `bashrc`
   (already done in this repo's [bashrc](bashrc)).

## MacOS system settings
- Install homebrew package manager
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- Install iterm2 on MacOS
```bash
brew install --cask iterm2
```
- __Iterm2__ settings
  - Iterm2 > Preferences > Profiles > Select profile name > Colors > [In basic colors]
    - Foreground: R = 0, G = 200, B = 0
    - Background: R = 0, G = 0, B = 0
    - Cursor colors > Cursor: R = 0, G = 200, B = 0
  - Uncheck this option: Prefs > Profiles > Terminal > Save lines to scrollback in alternate screen mode
    - This is done to avoid showing VIM buffer content in terminal. [Reference](https://superuser.com/questions/1022104/scrolling-up-in-iterm2-shows-previous-vim-sessions)
  - Iterm2 > Preferences > Profiles > Select profile name > Keys
    - In __Left option key__, select `Esc+`. This gives alternative of `ALT + b or f` using `left-option b or f`
    - __Note__: With [this](https://github.com/hansrajdas/dotfiles/commit/cf011d1489cfd45b71588c5a00b3e4c5ed3af7f5) commit, `vi` is enabled for command line also so this step will help if we go into some other prompt like `gdb`, `delve`, ...

- Fasten key repeat settings: Go to System preferences > keyboard
  - __Key Repeat__ should be fastest
  - __Delay Until Repeat__ should be one less than shortest
- Upgrade bash and make it default shell: https://www.shell-tips.com/mac/upgrade-bash/
- Execute `~/.bashrc` on startup
  - In MacOS `~/.bashrc` is not executed on startup so create `~/.bash_profile` and source `~/.bashrc` into it. See [this](https://apple.stackexchange.com/questions/12993/why-doesnt-bashrc-run-automatically) for details
