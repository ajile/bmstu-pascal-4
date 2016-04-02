echo "Compiling program $* ===================================================="
fpc -Fudirectory -gh ./$*/main.pas
echo "Running program $* ======================================================\n\n\n\n"
./$*/main