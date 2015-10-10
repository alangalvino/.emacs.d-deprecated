#!/bin/bash

if [ ! -e $@ ] ; then
    touch $@
fi
open -a /Applications/Emacs.app $@
