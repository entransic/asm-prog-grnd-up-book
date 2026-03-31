power: 
	as --32 -g power.s -o ./obj/power.o
	ld -melf_i386 ./obj/power.o -o ./bin/power

clean:
	rm -f ./obj/power.o
	rm -f ./bin/power

run:
	./bin/power
	@echo	'exit code'	$$?