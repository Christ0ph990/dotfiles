#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zsh/.zlogout
# $Date: 2011-10-26T22:00:39+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

zlogout_main() {
  zwc add --extension ~/.zshenv
  zwc add --extension ${ZDOTDIR}/.z*
  zwc add --ostype --extension --suffix . ${ZDOTDIR}/lib/* ${ZDOTTMP}
  zwc add --ostype --extension --suffix . ${ZDOTDIR}/misc/*.zsh ${ZDOTTMP}
  zwc add --ostype --extension --suffix . ${DOTDIR}/**/*.zsh ${ZDOTTMP}
}

zlogout_main
