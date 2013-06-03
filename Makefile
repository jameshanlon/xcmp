CFLAGS=-O3

.PHONY: elfer clean
all: xfastsim elfer cmp.elf

# Rule for generating object files (.o).
%.o:%.c
	gcc $(CFLAGS) -c $< -o $@
            
xfastsim:
	@echo 'Generating simulator executable ...'
	make -C sim

elfer:
	@echo 'Generating ELF builder executable ...'
	make -C elfer

# This uses the original compiler and the fast simulator to build a new binary
# (called sim2) of the bootstrapped compiler that implements the server
# functionality. Then, wrap it in ELF headers and output 'a.elf'.

cmp.elf: ecmps-2.x
	@echo 'Bootstrapping compiler ...'
	cp ecmps.bin a.bin 
	./sim/xfastsim < ecmps-1.x
	mv sim2 a.bin
	./sim/xfastsim < ecmps-2.x
	./elfer/elfer sim2
	mv a.elf cmp.elf
	rm a.bin

#./xfastsim < test.x

clean:
	@rm -f cmp.elf
	@rm -f sim2 axe1 log.txt
	@rm -f a.xe a.bin
	make -C elfer clean

