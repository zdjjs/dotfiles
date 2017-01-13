if [ -d /usr/local/opt/coreutils/libexec/gnubin ] ; then
  setopt no_global_rcs
  export PATH=/usr/local/opt/coreutils/libexec/gnubin:${PATH}
  export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}
  alias ls="ls --color -F"
  alias ll="ls -hl"
else
  alias ls='ls -GF'
  alias ll='ls -hl'
fi
