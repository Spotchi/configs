#!/bin/zsh
#===============================================================================
#
#             NOTES: For this to work you must have cloned the github
#                    repo to your home folder as ~/configs/
#
#===============================================================================

#==============
# Variables
#==============
dotfiles_dir=~/configs
log_file=~/install_progress_log.txt

#==============
# Delete existing dot files and folders
#==============
sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.tmux > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
# sudo rm -rf ~/.zsh_prompt > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
# sudo rm -rf ~/.gitconfig > /dev/null 2>&1
# sudo rm -rf ~/.antigen > /dev/null 2>&1
# sudo rm -rf ~/.antigen.zsh > /dev/null 2>&1
# sudo rm -rf ~/.psqlrc > /dev/null 2>&1
# sudo rm -rf ~/.conkyrc > /dev/null 2>&1
# sudo rm -rf ~/.tigrc > /dev/null 2>&1
# sudo rm -rf ~/.config > /dev/null 2>&1

#==============
# Create symlinks in the home folder
# Allow overriding with files of matching names in the custom-configs dir
#==============
# ln -sf $dotfiles_dir/vim ~/.vim
ln -sf $dotfiles_dir/vim/vimrc ~/.vimrc
ln -sf $dotfiles_dir/bash/bashrc ~/.bashrc
ln -sf $dotfiles_dir/tmux/tmux ~/.tmux
# ln -sf $dotfiles_dir/zsh/zsh_prompt ~/.zsh_prompt
ln -sf $dotfiles_dir/zsh/zshrc ~/.zshrc
# ln -sf $dotfiles_dir/config ~/.config
# ln -sf $dotfiles_dir/custom-configs/custom-snips ~/.vim/custom-snips

#if [ -n "$(find $dotfiles_dir/custom-configs -name gitconfig)" ]; then
#    ln -s $dotfiles_dir/custom-configs/**/gitconfig ~/.gitconfig
#else
#    ln -s $dotfiles_dir/gitconfig ~/.gitconfig
#fi

if [ -n "$(find $dotfiles_dir/custom-configs -name tmux.conf)" ]; then
    ln -s $dotfiles_dir/custom-configs/**/tmux.conf ~/.tmux.conf
else
    ln -s $dotfiles_dir/linux-tmux/tmux.conf ~/.tmux.conf
fi

#if [ -n "$(find $dotfiles_dir/custom-configs -name tigrc)" ]; then
#    ln -s $dotfiles_dir/custom-configs/**/tigrc ~/.tigrc
#else
#    ln -s $dotfiles_dir/tigrc ~/.tigrc
#fi

#if [ -n "$(find $dotfiles_dir/custom-configs -name psqlrc)" ]; then
#    ln -s $dotfiles_dir/custom-configs/**/psqlrc ~/.psqlrc
#else
#    ln -s $dotfiles_dir/psqlrc ~/.psqlrc
#fi


# Install packet management for Vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
sudo apt install build-essential cmake python3-dev

# YCM compilation
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer

# Grip markdown
pip install grip

#==============
# Select which conky to symlink
#==============
#echo -n "Install desktop or laptop conky? (Desk/Lap) => "; read answer

#if [[ $answer = "Desk" ]] ; then
#    ln -s ~/dotfiles/conky/_conkyrc_desktop ~/.conkyrc
#else
#    ln -s ~/dotfiles/conky/_conkyrc_laptop ~/.conkyrc
#    # Used to get battery status
#    sudo apt-get -y install acpi
#    if type -p acpi > /dev/null; then
#        echo "acpi Installed" >> $log_file
#    else
#        echo "acpi FAILED TO INSTALL!!!" >> $log_file
#    fi
#fi

#==============
# Set zsh as the default shell
#==============
sudo chsh -s /bin/zsh

#==============
# Give the user a summary of what has been installed
#==============
echo -e "\n====== Summary ======\n"
# cat $log_file
# echo
# rm $log_file
