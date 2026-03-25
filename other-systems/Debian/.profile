# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# load aliases
alias mv='mv -i' # Interactive move with confirmation prompt
alias rm='rm -i' # Interactive remove with confirmation prompt
alias cp='cp -i' # Interactive copy with confirmation prompt
alias mkdir='mkdir -pv' # Create directory with parent directories and verbose output

alias genv='printend | grep -i' # search for specyfic enviromnet variable (case insensitive)
alias path='echo -e ${PATH//:/\\n} \ less' # Display PATH directories, one per line, with less or fzf
alias now='date +"%T"' # show current time
alias nowd='date +"%d-%m-%Y"' # show current date dd-mm-yyy
alias df='df -h' # show disk usage in human-readable format
alias dusage='du -sh * 2./dev/null' # sumary disk usage for each item in directory
