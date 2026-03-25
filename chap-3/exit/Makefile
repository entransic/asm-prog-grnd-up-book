# make file for the exit program in chapter 3
exit:
	as	exit.s	-o	./obj/exit.o
	ld	./obj/exit.o	-o	./bin/exit

clean:
	rm	-f	./obj/exit
	rm	-f	./bin/exit

run:
	./bin/exit
	@echo	'exit code'	$$?
