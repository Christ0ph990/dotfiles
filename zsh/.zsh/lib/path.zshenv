#!/usr/bin/zsh
#
# $File: ${ZDOTDIR}/lib/path.zshenv
# $Date: 2011-12-13T06:51:46+0900$
# vim:filetype=sh:tabstop=2:shiftwidth=2:fdm=marker:

## ${HOME}/bin
if [ -d "${HOME}/bin" ]; then
  export PATH=${HOME}/bin:${PATH}
fi

## ${DOTDIR}/bin
if [ -d "${DOTDIR}/bin" ]; then
  export PATH=${DOTDIR}/bin:${PATH}
fi

## rvm
if [ -s "/usr/local/rvm/scripts/rvm" ];then
  source "/usr/local/rvm/scripts/rvm"
  alias rvm="sudo rvm"
elif [ -s "${HOME}/.rvm/scripts/rvm" ]; then
  source "${HOME}/.rvm/scripts/rvm"
fi
if [[ "${rvm_bin_path}" != "${rvm_path}/bin" ]] ; then
  regex="^([^:]*:)*${rvm_bin_path}(:[^:]*)*$"
  if [[ ! "${PATH}" =~ $regex ]] ; then
    export PATH="${rvm_bin_path}:${PATH}"
  fi
fi

## pybrew
# if [ -s "${HOME}/.pythonbrew/etc/bashrc" ]; then
  # source ${HOME}/.pythonbrew/etc/bashrc
  # if [ -s "${HOME}/.pythonbrew/bin/virtualenvwrapper.sh" ]; then
    # export VIRTUALENVWRAPPER_PYTHON=py2.7.2
    # source ${HOME}/.pythonbrew/bin/virtualenvwrapper.sh
  # fi
# fi

