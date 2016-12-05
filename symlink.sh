#!/usr/bin/env bash
for file in $(ls -A | egrep -v '(\.git|symlink.sh)')
do
  ln -f -s $(pwd)/$file $HOME/$FILE
done
