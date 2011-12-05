#!/usr/bin/zsh
#
# $File: ${DOTDIR}/zsh/.zsh/.zlogin
# $Date: 2011-12-05T22:02:08+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

# keychain init
if which keychain >/dev/null 2>&1; then
  [ ! -r "${HOME}/.keycahin/${HOST}-sh" ] && keychain id_rsa github_rsa
  source ${HOME}/.keychain/${HOST}-sh
fi

# go to saved path if there is one
if [ -f ${ZDOTTMP}/.zpathdump ]; then
  dir=`cat ${ZDOTTMP}/.zpathdump`
  if [ -d "${dir}" ]; then
    cd ${dir}
  fi
fi

