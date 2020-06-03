#set terminal postfile
#set output "loss.ps"
set title "Loss function"
set xlabel "Loss"
set ylabel "Pictures"
plot [0:100000] [0:100] "loss.dat" using 3:1, "loss.dat" using 3:2 pt 7 ps 1
pause -1 "Press any key to continue"
