#!/bin/sh

if [ -f /usr/local/bin/mas ] ; then
  echo '#!/bin/sh' > $(cd $(dirname $0)/;pwd)/list_mas
  /usr/local/bin/mas upgrade
  /usr/local/bin/mas list \
    | awk '{printf "mas install %s # %s %s %s\n", $1, $2, $3, $4}' >> $(cd $(dirname $0)/;pwd)/list_mas
fi

if [ -f /usr/local/bin/brew ] ; then
  echo '#!/bin/sh' > $(cd $(dirname $0)/;pwd)/list_cask
  /usr/local/bin/brew cask list \
    | awk '{printf "brew cask install %s\n", $1}' >> $(cd $(dirname $0)/;pwd)/list_cask
fi

if [ -f /usr/local/bin/brew ] ; then
  echo '#!/bin/sh' > $(cd $(dirname $0)/;pwd)/list_brew
  /usr/local/bin/brew leaves \
    | awk '{printf "brew install %s\n", $1}' >> $(cd $(dirname $0)/;pwd)/list_brew
fi

