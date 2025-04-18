#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Setup SSH Agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 15m > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [ ! -f "$SSH_AUTH_SOCK" ]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# Generic Colorizer https://github.com/garabik/grc
alias g++='/usr/bin/grc --colour=auto g++'
alias head='/usr/bin/grc --colour=auto head'
alias make='/usr/bin/grc --colour=auto make'
alias ld='/usr/bin/grc --colour=auto ld'
alias tail='/usr/bin/grc --colour=auto tail'
alias blkid='/usr/bin/grc --colour=auto blkid'
alias curl='/usr/bin/grc --colour=auto curl'
alias df='/usr/bin/grc --colour=auto df'
alias dig='/usr/bin/grc --colour=auto dig'
alias du='/usr/bin/grc --colour=auto du'
alias env='/usr/bin/grc --colour=auto env'
alias fdisk='/usr/bin/grc --colour=auto fdisk'
alias findmnt='/usr/bin/grc --colour=auto findmnt'
alias free='/usr/bin/grc --colour=auto free'
alias gcc='/usr/bin/grc --colour=auto gcc'
alias getfacl='/usr/bin/grc --colour=auto getfacl'
alias id='/usr/bin/grc --colour=auto id'
alias ifconfig='/usr/bin/grc --colour=auto ifconfig'
alias iptables='/usr/bin/grc --colour=auto iptables'
#alias jobs='/usr/bin/grc --colour=auto jobs'
alias last='/usr/bin/grc --colour=auto last'
alias lsattr='/usr/bin/grc --colour=auto lsattr'
alias lsblk='/usr/bin/grc --colour=auto lsblk'
alias lsmod='/usr/bin/grc --colour=auto lsmod'
alias lsof='/usr/bin/grc --colour=auto lsof'
alias lspci='/usr/bin/grc --colour=auto lspci'
alias mount='/usr/bin/grc --colour=auto mount'
alias netstat='/usr/bin/grc --colour=auto netstat'
alias ntpdate='/usr/bin/grc --colour=auto ntpdate'
alias ping='/usr/bin/grc --colour=auto ping'
alias ps='/usr/bin/grc --colour=auto ps'
alias pv='/usr/bin/grc --colour=auto pv'
alias sensors='/usr/bin/grc --colour=auto sensors'
alias showmount='/usr/bin/grc --colour=auto showmount'
alias sql='/usr/bin/grc --colour=auto sql'
alias ss='/usr/bin/grc --colour=auto ss'
alias stat='/usr/bin/grc --colour=auto stat'
alias sysctl='/usr/bin/grc --colour=auto sysctl'
alias systemctl='/usr/bin/grc --colour=auto systemctl'
alias tune2fs='/usr/bin/grc --colour=auto tune2fs'
alias ulimit='/usr/bin/grc --colour=auto ulimit'
alias uptime='/usr/bin/grc --colour=auto uptime'
alias vmstat='/usr/bin/grc --colour=auto vmstat'

alias ls='exa --icons -F -H --group-directories-first --git'
alias ll='ls -alF'
alias grep='grep --color=auto'
alias egrep='grep -E $GREP_OPTS --color=auto'
alias diff='diff --color=auto'
alias ip='ip -color-ncdu / --color dark --exclude-kernfs -x auto'
alias du='ncdu --color dark --exclude-kernfs -x'
alias ncdu='ncdu --color dark --exclude-kernfs -x'

export LESS='-R --use-color -Dd+r$Du+b$'
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"
export PROMPT_COMMAND='history -a'
export MAKEFLAGS="--jobs=$(nproc)"

PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
source "$HOME/.homesick/repos/homesick/homesick.sh"
source "$HOME/.homesick/repos/homesick/completions/homesick-completion.bash"

#PROMPT
neofetch
