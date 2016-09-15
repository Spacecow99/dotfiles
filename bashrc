#############################
#  Spacecow's .bashrc file  #
#############################


# If not interactive, stop.
case $- in
    *i*) ;;
      *) return;;
esac


# Set bash history variables
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000


# Set bash shell options
shopt -s checkwinsize
shopt -s histappend
shopt -s globstar  # The "**" pathname expansion will match all files and directories/subdirectories.


# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# Decide whether to use a coloured prompt or not
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    if [[ ${EUID} == 0 ]] ; then
        PS1='\[\033[01;31m\]\u@\h \[\033[01;34m\]\W \[\033[01;33m\][${SHLVL}]\[\033[00m\] '
    else
        PS1='\[\033[01;32m\]\u@\h \[\033[01;34m\]\w \[\033[01;33m\][${SHLVL}]\[\033[00m\] '
    fi
else
    PS1='\u@\h \w \$ '
fi
unset color_prompt force_color_prompt


# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#######################
#                     #
#  CUSTOMIZE ME HERE  #
#                     #
#######################


# Custom PATH
PATH=${PATH}:${HOME}/bin


# Custom aliases
alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias 8xxD='xxd'  # A tacocat made me do it...
alias lc='wc -l'

# Coloured GCC Errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# Coloured man page output
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
            LESS_TERMCAP_md=$(printf "\e[1;31m") \
            LESS_TERMCAP_me=$(printf "\e[0m") \
            LESS_TERMCAP_se=$(printf "\e[0m") \
            LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
            LESS_TERMCAP_ue=$(printf "\e[0m") \
            LESS_TERMCAP_us=$(printf "\e[1;32m") \
                man "$@"
}


# Print error message if multiple ssh connections for the same user from the same IP
function multiple_ssh_socks() {
    if [ ${SHLVL} -eq 1 -a $(who | grep $(whoami) | grep -v 'tty' | wc -l) -gt 1 ]; then
        printf "\e[01;31m[!] Multiple SSH connections detected!\e[0m\n" 1>&2
    fi
}; multiple_ssh_socks
