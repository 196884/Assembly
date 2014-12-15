%.o: %.s
	as $< -o $@

%: %.o
	ld $@ -lc -e _main -o $<
