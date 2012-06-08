#!/bin/sh

[ "$USER" ]	|| export USER=$(id -un)
[ "$UID" ]	|| export UID=$(id -u)
[ "$HOSTNAME" ]	|| export HOSTNAME=$(hostname)

. ~/lib/dotfiles/environ

if [ ! -d ~/.cache ]; then
	mkdir -p -m 0700 ~/.cache
fi

if [ "$PS1" ]; then
	[ -f ~/.hushlogin ] && motd -q
	echo `uptime`
fi

if [ "$BASH_VERSION" ]; then
	[ -f ~/.bashrc ] && . ~/.bashrc
fi

# Local settings

if [ -f ~/lib/dotfiles/profile-$HOSTNAME ]; then
	. ~/lib/dotfiles/profile-$HOSTNAME
elif [ -f ~/.profile-$HOSTNAME ]; then
	. ~/.profile-$HOSTNAME
fi

if [ "$LOCAL_PERL" = "n" ]; then
	export PERL_CPANM_OPT='--sudo'
else
	export PERL_MM_OPT="INSTALL_BASE='$PREFIX'"
	export PERL_MB_OPT="--install_base '$PREFIX'"
fi

: # return a true value
