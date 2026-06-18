# .bashrc
# 1. Sesja logowania:
#   /etc/profile → ~/.bash_profile (lub ~/.bash_login, ~/.profile)
#                 → ~/.bashrc (jeśli wywołany z ~/.bash_profile)
# 2. Sesja interaktywna (non-login):
#   /etc/bash.bashrc → ~/.bashrc
# 3. Sesja nieinteraktywna:
#   Zmienna $BASH_ENV wskazuje plik do wczytania.

# Globalne pliki konfiguracyjne: 
# /etc/profile – Dla sesji logowania.
# /etc/bash.bashrc – Dla sesji interaktywnych.
# NOTE:
# ~/.bashrc: executed by bash(1) for non-login shells. See /usr/share/doc/bash/examples/startup-files (in the package bash-doc) for examples

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.config/bashrc.d ]; then
    for rc in ~/.config/bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# load cargo env
if [ -f "$HOME/.cargo/env" ]; then 
    . "$HOME/.cargo/env"
fi
