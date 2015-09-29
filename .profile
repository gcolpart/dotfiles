# Debian 
#export DEBFULLNAME='John Doe'
#export DEBEMAIL='jdoe@example.com'

# misc
#export PRINTER=print
#export TZ='America/New_York'
#export TZ='US/Pacific'
#export TZ='America/Montreal'

# core dumps
ulimit -c unlimited

#if [ $HOSTNAME == foo ] || [ $HOSTNAME == bar] ; then
    #keychain id_rsa --timeout 600
    if ! pidof xscreensaver >/dev/null; then
        xscreensaver &
    fi
    xrdb -load ~/.Xdefaults
#fi

# Add ~/bin to $PATH
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# Force charset
#export LANG=fr_FR.UTF8
#export LANGUAGE=fr_FR.UTF8
#export LC_ALL=fr_FR.UTF8
#export LC_TYPE=fr_FR.UTF8

# PS1
parse_git_branch ()
{
        if git rev-parse --git-dir >/dev/null 2>&1
        then  
                gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p') 
        else  
                return 0
        fi    
        echo "[$gitver]"
}
#export PS1="\[\e[1;33m\]\u\[\e[0m\]@\[\e[0;35m\]\h\[\e[0m\]:\[\e[0;32m\]\w\[\e[0m\]\$ " 
#export PS1="\$( parse_git_branch)% "
export PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$ \$( parse_git_branch) "


# if running bash include .bashrc
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

