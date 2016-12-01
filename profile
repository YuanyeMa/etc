# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
# and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).

if [ "$PS1" ]; then
  if [ "$BASH" ] && [ "$BASH" != "/bin/sh" ]; then
    # The file bash.bashrc already sets the default PS1.
    # PS1='\h:\w\$ '
    if [ -f /etc/bash.bashrc ]; then
      . /etc/bash.bashrc
    fi
  else
    if [ "`id -u`" -eq 0 ]; then
      PS1='# '
    else
      PS1='$ '
    fi
  fi
fi

if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

export PS1='\[\033[0;36m\]* \w *\[\033[0m\n  `if [[ $? = '0' ]]; then echo "\[\033[1;33m\]";else echo "\[\033[0;31m\]";fi`\u→ \$ \[\033[0m\]'

# 2016年 09月 04日 星期日 12:09:42 CST
# Hisilicon Linux, Cross-Toolchain PATH
export PATH="/opt/hisi-linux-nptl/arm-hisiv100-linux/target/bin:$PATH" 
# 

export PATH="/opt/arm-2009q3/bin:$PATH"
#for qt
export QTDIR=/usr/local/Trolltech/Qt-4.7.4   
export PATH=$QTDIR/bin:$PATH   
export MANPATH=$QTDIR/man:$MANPATH   
export LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH  
