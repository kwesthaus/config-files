# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd autopushd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/orville/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# this file is "sourced by zsh when opening a new terminal or starting a new zsh session from with a running session"
# https://serverfault.com/questions/901403/zsh-not-sourcing-zprofile

################################################################################
# I INSERTED MANUALLY EVERYTHING IN THIS BLOCK

alias batl='bat --paging never'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gd='git diff'
alias glo='git log --pretty=oneline'
alias glon="git log --pretty=oneline | head -n"
alias gpl='git pull'
alias gps='git push'
alias grb='git rebase'
alias grs='git reset'
alias gs='git status'
alias gsh='git stash'
alias ll='ls -l'
alias la='ls -a'
alias lal='ls -la'
alias v='vim'
alias s='sudo'
alias r='ranger'
alias par='ping archlinux.org'
alias pal='ping alarm.localdomain'
alias teef='tee 1>/dev/null'
alias rsync='rsync --progress'
alias nmapf='nmap --min-rate 4500 --max-rtt-timeout 1500ms'

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

cursor_mode() {
    # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursors
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}

cursor_mode

powerline-daemon -q
. /usr/share/powerline/bindings/zsh/powerline.zsh

export EDITOR=vim

export KEYTIMEOUT=1

export CHROOT=$HOME/clean-chroots

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/active
source /usr/bin/virtualenvwrapper.sh

# zsh-bd
source $HOME/.config/zsh/plugins/bd/bd.zsh

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# END MY BLOCK
################################################################################

################################################################################
# I COPIED THIS BLOCK FROM ~/.bashrc

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

# Change the window title of X terminals
case ${TERM} in
        xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
        	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        	;;
        screen*)
        	PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
        	;;
esac

alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

alias cp='cp -i'                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias more=less

alias vi=vim

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# END BASH COPY BLOCK
################################################################################
