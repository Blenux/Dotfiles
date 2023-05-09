#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

date +"Today is: %A %d %B %Y"

alias ls='ls  --color=auto'
alias la='ls -al  --color=auto'

alias grep='grep --color=auto'

PS1='[\u@\h \W]\$ '

alias install="sudo pacman -S"
alias update="sudo pacman -Syu"

alias reboot="reboot -h now"
alias neo="neofetch"


