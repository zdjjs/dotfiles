export LANG=ja_JP.UTF-8  # 文字コードをUTF-8に設定
export KCODE=u           # KCODEにUTF-8を設定
export AUTOFEATURE=true  # autotestでfeatureを動かす

setopt no_beep           # ビープ音を鳴らさないようにする
setopt auto_cd           # ディレクトリ名の入力のみで移動する 
setopt auto_pushd        # cd時にディレクトリスタックにpushdする
setopt correct           # コマンドのスペルを訂正する
setopt magic_equal_subst # =以降も補完する(--prefix=/usrなど)
setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う
setopt notify            # バックグラウンドジョブの状態変化を即時報告する

REPORTTIME=3

fpath=(~/.zsh/zsh-completions/src $fpath)
autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
unsetopt auto_menu             # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

setopt glob
setopt glob_complete  # globを展開しないで候補の一覧から補完する。
setopt extended_glob # グロブ機能を拡張する
unsetopt caseglob    # ファイルグロブで大文字小文字を区別しない
setopt mark_dirs   # globでパスを生成したときに、パスがディレクトリだったら最後に「/」をつける。
setopt numeric_glob_sort  # 辞書順ではなく数字順に並べる。

setopt always_last_prompt

HISTFILE=~/.zsh_history
HISTSIZE=10000            # メモリに保存されるヒストリの件数
SAVEHIST=10000            # 保存されるヒストリの件数
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する
setopt append_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt hist_save_no_dups
setopt EXTENDED_HISTORY

# プロンプトに色を付ける
autoload -U colors; colors

autoload -Uz add-zsh-hook
autoload -Uz vcs_info

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}"
zstyle ':vcs_info:*' formats "%F{green}%c%u(%b)%f"
zstyle ':vcs_info:*' actionformats '(%b|%a)'
precmd(){vcs_info}
PROMPT="%{${fg[cyan]}%}%n%{${reset_color}%}@%{${fg[cyan]}%}%m%{${reset_color}%}"'${vcs_info_msg_0_}'"%# "

# 一般ユーザ時
PROMPT2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
RPROMPT="%{${fg[cyan]}%}[%~]%{${reset_color}%}"
SPROMPT="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# rootユーザ時
if [ ${UID} -eq 0 ]; then
  PROMPT="%{${bg[cyan]}%}%n%{${reset_color}%}@%{${fg[cyan]}%}%m%{${reset_color}%"'${vcs_info_msg_0_}'"%# "
fi

if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
  zcompile ~/.zshrc
fi

PATH="/Users/zdjjs/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/zdjjs/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/zdjjs/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/zdjjs/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/zdjjs/perl5"; export PERL_MM_OPT;

function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
    CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history

