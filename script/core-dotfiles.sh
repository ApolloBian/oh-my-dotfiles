#!/usr/bin/env bash

# fish_conf="$HOME/.config/fish/conf.d"

# if [[ -d "$dotfiles" ]]; then
#   echo "Symlinking dotfiles from $dotfiles"
# else
#   echo "$dotfiles does not exist"
#   exit 1
# fi
find ./ -name '*' | grep ./install.py >> /dev/null
if [[ $? != 0 ]]; then
    echo "ERROR: This file need to be executed in \$oh-my-dotfiles"
    pwd
    exit
fi

dotfile_path="resources/dotfiles"

echo "Symlinking dotfiles in $(pwd)/$dotfile_path"
link() {
  from="$1"
  to="$2"
  echo "Linking '$from' to '$to'"
  rm -f "$to"
  dirname=`dirname "$to"`
  mkdir -p $dirname
  ln -s "$from" "$to"
}

for file in $(find $dotfile_path -name '*'); do
  file="${file##*/}"
  # file="${file%.sh}"
  link "$(pwd)/$dotfile_path/$file" "$HOME/.$file"
done


# --------some workaround for using different git username
# --------set user.name = tianling@hostname 
source $HOME/.env
xdg_config_path=resources/
mkdir -p $xdg_config_path/git
git_username_file=$xdg_config_path/git/config
if [[ `uname` == 'Darwin' ]]; then
    HOST=`hostname`
else
    HOST=`cat /proc/sys/kernel/hostname`
fi
echo '[user]' > $git_username_file
echo '	name=Tianling@'"$HOST" >> $git_username_file
# --------------------------------------------------------

link $(pwd)/resources/oh-my-zsh $HOME/.oh-my-zsh
link $(pwd)/resources/custom.zsh-theme $HOME/.oh-my-zsh/custom/themes/custom.zsh-theme
touch ~/.local_env

# Link Fish Config
# for location in $(find home -name '*.fish'); do
#   file="${location##*/}"
#   echo $location, $file
#   link "$dotfiles/$location" "$fish_conf/$file"
# done
