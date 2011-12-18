#!/usr/bin/sh
#
# $File: ${ZDOTDIR}/lib/export.zshenv
# $Date: 2011-12-12T17:44:30+0900$
# vim:filetype=sh:tabstop=2:shiftwidth=2:fdm=marker:

# Lang
export LANG=ja_JP.UTF-8

# Timezone
export TZ=JST-9

# PAGER
if type lv > /dev/null 2>&1; then
    export PAGER="lv"
else
    export PAGER="less"
fi
if [ "$PAGER" = "lv" ]; then
  export LV="-c -l"
else
  alias lv="$PAGER"
fi

## Rsense
if [ -d /usr/lib/rsense ]; then
  export RSENSE_HOME=/usr/lib/rsense
fi
