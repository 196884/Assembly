exit_01: exit_01.o
	ld exit_01.o -lc -e _main -o exit_01

exit_01.o: exit_01.s
	as exit_01.s -o exit_01.o

