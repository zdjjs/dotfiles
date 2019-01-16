setopt no_global_rcs
export PATH=/usr/local/sbin:/usr/local/bin:${PATH}:/usr/sbin:/sbin

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_INSTALL_CLEANUP=1

if [ -d /usr/local/opt/coreutils/libexec/gnubin ] ; then
  export PATH=/usr/local/opt/coreutils/libexec/gnubin:${PATH}
  export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}
fi
