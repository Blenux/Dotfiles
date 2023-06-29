#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

date +"Today is: %A %d %B %Y"

alias ls='ls  --color=auto'
alias la='ls -al  --color=auto'
alias lsa='ls -a  --color=auto'

alias grep='grep --color=auto'

PS1='[\u@\h \W]\$ '

# Quick bashrc alias
alias brc='code ~/.bashrc'

# Manually reload i3 in case of config oopsies
alias i3r="i3-msg reload"

# copy i3 to Dotfile Location
#alias bki3="cp -r /home/juso3d/.config/i3/ /home/juso3d/Documents/Dotfiles/.config/"

# Dont allow make to use all cores to keep system stability.
alias ml='make NPROCS=3'
alias m2='make NPROCS=3 lite'

# Pacman
alias pi='sudo pacman -S'
alias pu='sudo pacman -Syu'
alias ps='pacman -Ss'
alias pr='sudo pacman -R'
alias prs='sudo pacman -Rns'

# Yay
alias ys='yay -Ss'
alias yi='yay -S'
alias yu='yay -Syu'
alias yr='yay -R'
alias yrs='yay -Rns'

# Flatpak
alias fpi='flatpak install'
alias fpr='flatpak remove'
alias fps='flatpak search'
alias fpa='flatpak update'

# Shutdown, Reboot
alias shutdown='shutdown -h now'
alias reboot='reboot -h now'

# Terminal Apps
alias neo='neofetch'
alias cmx='cmatrix'

source ~/.config/functions.sh

export PATH="/usr/bin/dolphin:$PATH"

# make steam use native runtimes (blender crashes)
export STEAM_RUNTIME=0
export STEAM_NATIVE=1


