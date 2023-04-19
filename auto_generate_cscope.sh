#!/bin/sh
ctags -R .
rm cscope.*
find `pwd` -name "*.h" -o -name "*.c" -o -name "*.cc" > cscope.files
cscope -bqkR
