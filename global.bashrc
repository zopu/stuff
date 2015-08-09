# .bashrc file to be used across platforms/devices

# Mac-specific stuff
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
  alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
  alias gm='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -t'
fi
