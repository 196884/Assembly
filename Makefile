exit_01: exit_01.o
	ld exit_01.o -lc -e _main -o exit_01

exit_01.o: exit_01.s
	as exit_01.s -o exit_01.o

fn_call_02: fn_call_02.o
	ld fn_call_02.o -lc -e _main -o fn_call_02

fn_call_02.o: fn_call_02.s
	as fn_call_02.s -o fn_call_02.o

factorial_rec_03: factorial_rec_03.o
	ld factorial_rec_03.o -lc -e _main -o factorial_rec_03

factorial_rec_03.o: factorial_rec_03.s
	as factorial_rec_03.s -o factorial_rec_03.o
