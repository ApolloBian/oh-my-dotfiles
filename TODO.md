# TODO:
 - [x] migrate TODO to TODO.md
 - [ ] patch `fira-code` & `source code pro` font for vim-devicons
 - [ ] auto install iterm (darwin only)
    - [ ] iterm bin
    - [ ] iterm theme
 - [ ] zsh tweak
    - [Zsh community projects](https://github.com/zsh-users)
    - [x] autocompletion and highlighting
        - [x] tweak highlighting
        - [x] tweak autocompletion
    - [x] [zsh-completions](https://github.com/zsh-users/zsh-completions)
    - [ ] manage zsh plugins with antigen
 - [ ] fcitx for server profile
 - [ ] learn about vim tagbar
 - [ ] learn about vim scroll through buffer (Liu yu chen's dotfiles)
 - [x] add menu in readme
 - [ ] Ant
 - [ ] Boston
 - [x] system dependent settings
    - [Refer to this link!](https://github.com/Leoyzen/dotfiles)
    - [x]independent, editable enviroment ( which does not effect configurations on other machines)
 - [x] merge MaintainNotes into project wiki
 - [x] bundle latest version of vim
 - [x] submodule init
 - [x] finish vim related part:
    - vundle
    - ycm update submodule
 - [x] finish oh-my-zsh part:
    - move custom theme to oh-my-zsh/custom
 - [x] modulization
 - [x] ship latest version of vim !
 - [x] Rename project to awesome-env
 - [x] badges
    - [x] awesome
    - [x] badges: [shields.io](https://img.shields.io/) [简书链接](http://www.jianshu.com/p/e9ce56cb24ef)
 - [x] tmux 
    - [x] tmux 2.6
    - [x] outside $TERM: xterm-256color
    - [x] inside $TERM: xterm-256color
    - [x] termoverride
    - [x] try 2 versions of xterm-terminfo: from writer, from arch
        - conclusion: from writer
    - [x] infocmp -x > xterm-terminfo
    - [x] edit xterm-terminfo, add `Tc,`
    - [x] tic -o ~/.terminfo -x xterm-terminfo
