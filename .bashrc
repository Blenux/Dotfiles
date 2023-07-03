# Blenux(Juso3D) .bashrc 2023

# Full Colors:
export TERM="xterm-256color"

# Confirm Before Overwriting Something:
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# Get Error Messages From Journalctl
alias jctl="journalctl -p 3 -xb"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Show Date in Terminal
date +"Today is: %A %d %B %Y"

# Colorize ls output:
alias ls='ls  --color=auto'
alias la='ls -al  --color=auto'
alias lsa='ls -a  --color=auto'

# Colorize grep output:
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Only Show Full Path:
PS1='\w\$ '

# Quick bashrc alias
alias brc='code ~/.bashrc'
alias sbrc='source ~/.bashrc'

# Manually reload i3 in case of config oopsies
alias i3r="i3-msg reload"

# copy i3 to Dotfile Location
#alias bki3="cp -r /home/juso3d/.config/i3/ /home/juso3d/Documents/Dotfiles/.config/"

# Dont allow make to use all cores to keep system stability.
alias m1='cd ~/Git/Bforartists && make NPROCS="$(nproc --ignore=2)"'
# alias m2='make NPROCS="$(nproc --ignore=2)" lite'
alias m2='cd ~/Git/Bforartists && make NPROCS="$(nproc --ignore=2)" lite'

# Bforartists Compiles
alias b1='~/Git/build_linux_full/bin/bforartists'
alias b2='~/Git/build_linux_lite/bin/bforartists'

# Flatpak:
alias fpi='flatpak install'
alias fpu='flatpak uninstall'
alias fps='flatpak search'
alias fpa='flatpak update'

# Flatpak User:
alias fpiu='flatpak install --user'
alias fpuu='flatpak uninstall --user'

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

# Exit
alias shutdown='shutdown -h now'
alias reboot='reboot -h now'
alias logout='pkill -KILL -u $USER'

# Terminal Apps:
alias neo='neofetch'
alias cmx='cmatrix'

# Creates A New Directory And Immediately NBavigate Into It:
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Open Current Directory in File Manager:
opendir() {
    # Add your preferred file manager command here, fallback is xdg-open:
    ranger
}
