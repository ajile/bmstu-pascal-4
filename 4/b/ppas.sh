#!/bin/sh
DoExitAsm ()
{ echo "An error occurred while assembling $1"; exit 1; }
DoExitLink ()
{ echo "An error occurred while linking $1"; exit 1; }
echo Assembling main
/usr/bin/clang -c -o /Users/ajile/Learning/bmstu-pascal-4/4/b/lib/i386-darwin/main.o  -arch i386 -mmacosx-version-min=10.4 -x assembler /Users/ajile/Learning/bmstu-pascal-4/4/b/lib/i386-darwin/main.s
if [ $? != 0 ]; then DoExitAsm main; fi
rm /Users/ajile/Learning/bmstu-pascal-4/4/b/lib/i386-darwin/main.s
echo Linking main
OFS=$IFS
IFS="
"
/usr/bin/ld /usr/lib/crt1.o        -multiply_defined suppress -L. -o main `cat link.res` -pagezero_size 0x10000
if [ $? != 0 ]; then DoExitLink main; fi
IFS=$OFS
