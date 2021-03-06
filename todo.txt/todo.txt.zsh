#!/bin/zsh
#
# $File: ${DOTDIR}/todo.txt/todo.txt.zsh
# $Date: 2012-12-16T00:21:06+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

! which todo.sh >/dev/null 2>&1 && return 1

function t() {
  if [ $# -eq 0 ]; then
    todo.sh ls
  else
    todo.sh $*
  fi
}

# compdef _todo.sh t

alias tn="td ls +next"
alias ta="td add"

function todo-edit-rc {
  ${EDITOR-vi} ${DOTDIR}/todo.txt/.todo.cfg
}
