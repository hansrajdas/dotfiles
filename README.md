## dotfiles
- [.common.vim](.common.vim): Common to .vimrc and .gvimrc
- [.vimrc](.vimrc): Few useful vim settings
- [.gvimrc](.gvimrc): Few useful gvim settings
- [.bash_aliases](.bash_aliases): Bash aliases

## Additional settings
### Install iterm2 on MacOs
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


### git-completion.bash
To get latest `git-completion.bash` file, run below command from `$HOME` directory
```bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O
```

### Make default shell as bash
Follow: https://www.shell-tips.com/mac/upgrade-bash/

### Fasten key repeat settings
MacOs > System preferences > keyboard
- __Key Repeat__ should be fastest
- __Delay Until Repeat__ should be shortest
