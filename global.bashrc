# .bashrc file to be used across platforms/devices

alias gm='emacsclient -t'
export EDITOR='emacsclient -t'

# Mac-specific stuff
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
  alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
  alias gm='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -t'
  export EDITOR='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -t'
fi
