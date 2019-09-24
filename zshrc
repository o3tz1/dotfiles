# Path to your oh-my-zsh installation.
export ZSH="~/.oh-my-zsh"

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History:
HISTCONTROL=ignoredups:ignorespace
HISTIGNORE="&:ls:exit:lo:ll:history"
HISTSIZE=1000
HISTFILESIZE=10000
HISTTIMEFORMAT="%d/%m/%y %T "

#Exports
export EDITOR='/usr/bin/vim'
export PAGER='/usr/bin/less'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

plugins=(
    #git
    colored-man-pages
)

# source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi

#More aliases
alias ls='ls --color=auto'
alias whatismyip='curl https://ipinfo.io/ip'
alias vi='/usr/bin/vim'
alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"
alias weather='curl v2.wttr.in'
alias e64=encode64
alias d64=decode64

encode64() {
    if [[ $# -eq 0 ]]; then
        cat | base64
    else
        printf '%s' $1 | base64
    fi
}

decode64() {
    if [[ $# -eq 0 ]]; then
        cat | base64 --decode
    else
        printf '%s' $1 | base64 --decode
    fi
}

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
