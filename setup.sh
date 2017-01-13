DOT_FILES=(.gitconfig .gitignore .vim .vimrc .zshrc .zshenv)
for file in ${DOT_FILES[@]}
do
  if [ -L $HOME/$file ]; then
    rm $HOME/$file -f
  elif [ -d $HOME/$file ]; then
    rm -d $HOME/$file -fr
  fi
  if [ -e  $HOME/$file ]; then
    echo "$HOME/$file 存在します"
  else
    ln -s $(cd $(dirname $0)/;pwd)/$file $HOME/$file
    echo "$file リンクしました"
  fi
done


