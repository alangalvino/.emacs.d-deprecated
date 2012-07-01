 #!/bin/sh 

EMACS=emacs
EMACSCLIENT=emacsclient
FLAGS=-n

$EMACSCLIENT -e nil >/dev/null || $EMACS --daemon 

NR_FRAMES=$($EMACSCLIENT -e '(1- (length (frame-list)))') 

if [ $NR_FRAMES -eq 0 ];then 
    FLAGS="$FLAGS -c" 
fi 

$EMACSCLIENT $FLAGS "$@" &
