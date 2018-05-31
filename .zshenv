export HOMEBREW_NO_ANALYTICS=1

PATH="/usr/local/sbin:$PATH"

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

if [ -r /usr/local/bin/exa ] ; then
  alias ls='exa'
  alias ll='exa -hlg --git --time-style long-iso'
fi

if [ -d $HOME/.nodebrew/current/bin ] ; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

if [ -r /usr/local/bin/fzf ]; then
  export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
fi

if [ -r /usr/local/bin/git ]; then
  export PATH=/usr/local/bin/git:${PATH}
fi
