exit_01: exit_01.o
	ld exit_01.o -lc -e _main -o exit_01

exit_01.o: exit_01.s
	as exit_01.s -o exit_01.o

fn_call_02: fn_call_02.o
	ld fn_call_02.o -lc -e _main -o fn_call_02

fn_call_02.o: fn_call_02.s
	as fn_call_02.s -o fn_call_02.o

