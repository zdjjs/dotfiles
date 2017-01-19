if [ -d /usr/local/opt/coreutils/libexec/gnubin ] ; then
  setopt no_global_rcs
  export PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:${PATH}
  export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}
  alias ls="ls --color -F"
  alias ll="ls -hl"
else
  alias ls='ls -GF'
  alias ll='ls -hl'
fi

if [ -d $HOME/.nodebrew/current/bin ] ; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

