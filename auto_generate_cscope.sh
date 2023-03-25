ctag -R .
rm cscope.*
find `pwd` -name "*.c" >> cscope.files
cscope -bqk
