# Path to your oh-my-zsh installation.
export ZSH="~/.oh-my-zsh"

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History:
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zhistory
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt EXTENDED_HISTORY
# Bash like, long history. 
alias history='fc -il 1'

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
alias cls=clear
alias gcal='gcal -s 1 -K --iso-week-number=yes -q fi'
alias myips="ip -o addr | awk '{split(\$4, a, \"/\"); print \$2\" : \"a[1]}' | grep -v '::'"

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

pdfgen() {
    if [ $# -eq 0 ]; then
        echo "Supply a markdown filename as an argument"
    else
        in=$1
        out=$(echo $in | cut -f 1 -d '.')
        pandoc $in -o $out'.pdf' --from markdown --template template.latex --listings --toc -V lang=fi
    fi
}

csvcat() {
    if [ $# -eq 0 ]; then
        echo "Supply a markdown filename as an argument"
    else
        in=$1
        cat $in | column -t -s, | less -S 
    fi
}

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
