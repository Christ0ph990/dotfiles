#!/bin/zsh
#
# $File: ${ZDOTDIR}/lib/path.darwin.zshenv
# $Date: 2012-02-22T00:22:48+0900$
# vim:filetype=zsh:tabstop=2:shiftwidth=2:fdm=marker:

cdpath=($HOME/Dropbox/Projects $HOME/Dropbox)

## Xcode
export CC=/usr/bin/gcc-4.2
if [ -d /Developer/usr/bin ]; then
  export PATH=$PATH:/Developer/usr/bin
fi

## ruby
if [ -d /usr/local/Cellar/ruby ]; then
  LASTEST=`ls -1v /usr/local/Cellar/ruby | tail -1`
  if [ -n ${LASTEST} ]; then
    export PATH=/usr/local/Cellar/ruby/${LASTEST}/bin:${PATH}
  fi
  unset LASTEST
fi

## npm
if [ -d /usr/local/lib/node_modules/npm/bin ]; then
  export PATH=$PATH:/usr/local/lib/node_modules/npm/bin
fi

## MacUIM
if [ -d /Library/Frameworks/UIM.framework/Versions/Current/bin ]; then
  export PATH=$PATH:/Library/Frameworks/UIM.framework/Versions/Current/bin
fi

