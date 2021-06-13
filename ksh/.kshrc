# Default editor
export VISUAL=vi
export EDITOR="$VISUAL"
export EDITOR="vi"

# Make colorcoding available for everyone

Black='\[\e[0;30m\]' # Black
Red='\[\e[0;31m\]'  # Red
Green='\[\e[0;32m\]' # Green
Yellow='\[\e[0;33m\]' # Yellow
Blue='\[\e[0;34m\]'  # Blue
Purple='\[\e[0;35m\]' # Purple
Cyan='\[\e[0;36m\]'  # Cyan
White='\[\e[0;37m\]' # White

# Bold
BBlack='\[\e[1;30m\]' # Black
BRed='\[\e[1;31m\]'  # Red
BGreen='\[\e[1;32m\]' # Green
BYellow='\[\e[1;33m\]' # Yellow
BBlue='\[\e[1;34m\]' # Blue
BPurple='\[\e[1;35m\]' # Purple
BCyan='\[\e[1;36m\]' # Cyan
BWhite='\[\e[1;37m\]' # White

# Background
On_Black='\[\e[40m\]' # Black
On_Red='\[\e[41m\]'  # Red
On_Green='\[\e[42m\]' # Green
On_Yellow='\[\e[43m\]' # Yellow
On_Blue='\[\e[44m\]' # Blue
On_Purple='\[\e[45m\]' # Purple
On_Cyan='\[\e[46m\]' # Cyan
On_White='\[\e[47m\]' # White

HISTFILE="$HOME/.ksh_history"
HISTSIZE=5000

NC='\[\e[m\]'   # Color Reset
ALERT="${BWhite}${On_Red}" # Bold White on red background

# Show directory on prompt
PS1='$(print -n "`logname`@`hostname`:";if [[ "${PWD#$HOME}" != "$PWD" ]] then; print -n "~${PWD#$HOME}"; else; print -n "$PWD";fi;print "\n$ ")'

# Aliases

alias c='clear'
alias sudo='doas'
alias ..='cd ..'
alias ls='ls -lah --color=auto --group-directories-first'
alias ll='s -lisa --color=auto'
alias mkdir='mkdir -pv'
alias free='free -mt'
alias ps='ps auxf'
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'
alias wget='wget -c'
alias histg='history | grep'
alias myip='curl ipv4.icanhazip.com'
alias grep='grep --color=auto'
alias diff='diff --colot=auto'
alias q='exit'
alias kl='pkill'
alias home='cd ~'
alias root='cd /'
alias reboot="shutdown -r now"
alias off="shutdown -h now"
alias reload='source ~/.bashrc' #reloads .bashrc
alias nnn='nnn -e'
alias cdd='fzf'
alias vpn='windscribe connect'
alias bgt='scim mybudget.csv'
alias xr='xrdb -merge .Xresources'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias cln='git clone'
alias md='mkdir'
alias k='kak'
alias pi='sudo pacman -S'
alias pu='sudo pacman -Syyu'
alias puu='sudo pacman -Syy'
alias pr='sudo pacman -Rsn'
alias a='yay'
alias ai='yay -S'
alias au='yay -Syyu'
alias auu='yay -Syy'
alias ar='yay -Rsn'
alias b='bash'
alias rt='rtorrent'
alias se='sudoedit'
alias yv='youtube-viewer'
alias yvv='youtube-viewer -SV'
alias xterm='xterm -b 30'
alias feh="feh --image-bg black -Z -."
alias qbexp="sed -E 's|^(\S+) ?(.*)|<a href="\1">\2</a>|' ~/.config/qutebrowser/bookmarks/urls > qutebrowser-bookmarks.html"
alias rss='canto-curses'
alias flash='sudo balena-etcher-electron'
alias xtest='xrandr --output DVI-I-1 --mode "1600x1200_60.00"'
alias brutaldoom='gzdoom brutalv21.pk3'
alias yd='youtube-dl'
alias mp3='youtube-dl --extract-audio --audio-format mp3'
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# Get the name of our branch and put parenthesis around it
#gitBranch() {
#        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
#  }

# Build the prompt
#export PS1="${pathC}\w ${gitC}\$(gitBranch) ${pointerC}\$${normalC} "

#Set PATH so it includes user's private bin directories
PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}"

# fff config
export FFF_HIDDEN=1
export FFF_FAV1=~/dotfiles/
export FFF_FAV2=~/.bashrc
export FFF_FAV3=~/.Xresources
export FFF_FAV4=~/.config/
export FFF_FAV5=~/.xinitrc
export FFF_FAV6=/usr/share
export FFF_FAV7=~/.local/src/dwm
export FFF_FAV8=~/.local/src/dmenu/
export FFF_FAV9=/

# Auto cd on exit for fff
f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

# Enable vi mode
set -o vi

# pfetch config
PF_INFO="os uptime memory shell editor wm" pfetch
