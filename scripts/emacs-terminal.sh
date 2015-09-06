#!/bin/bash

# try open a file with emacs
if open -a /Applications/Emacs.app $@ 2>/dev/null
then
    # bring emacs to front
    osascript -e 'tell application "Emacs.app" to activate'
else
    # if file doesnt exist then create
    touch $@
    open -a /Applications/Emacs.app $@ && osascript -e 'tell application "Emacs.app" to activate'
fi
