## dotfiles
- [vimrc](vimrc): VIM settings
- [bashrc](bashrc): Bashrc file
- [tmux.conf](tmux.conf): tmux.conf file, don't use this much
- [setup.sh](setup.sh): Setup file for installation and backup of current configs

## Additional settings
### MacOS
- Install iterm2 on MacOS
```bash
brew install --cask iterm2
```
- __Iterm2__ settings
  - Iterm2 > Preferences > Profiles > Select profile name > Colors > [In basic colors]
    - Foreground: R = 0, G = 200, B = 0
    - Background: R = 0, G = 0, B = 0
    - Cursor colors > Cursor: R = 0, G = 200, B = 0
  - Iterm2 > Preferences > Profiles > Select profile name > Keys
    - In __Left option key__, select `Esc+`. This gives alternative of `ALT + b or f` using `left-option b or f`
    - __Note__: With [this](https://github.com/hansrajdas/dotfiles/commit/cf011d1489cfd45b71588c5a00b3e4c5ed3af7f5) commit, `vi` is enabled for command line also so this step will help if we go into some other prompt like `gdb`, `delve`, ...

- Upgrade bash and make it default shell: https://www.shell-tips.com/mac/upgrade-bash/
- Fasten key repeat settings: Go to System preferences > keyboard
  - __Key Repeat__ should be fastest
  - __Delay Until Repeat__ should be one less than shortest
- Execute `~/.bashrc` on startup
  - In MacOS `~/.bashrc` is not executed on startup so create `~/.bash_profile` and source `~/.bashrc` into it. See [this](https://apple.stackexchange.com/questions/12993/why-doesnt-bashrc-run-automatically) for details
