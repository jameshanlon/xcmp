PROGRAM=elf
CFLAGS=-O2
OBJS=elf.o

all: elf

# Rules for generating object files (.o).
%.o:%.c
	gcc $(CFLAGS) -c $< -o $@
            
# Rules for generating the executables.
$(PROGRAM): main.c $(OBJS)
	@echo 'Generating executable ...'
	gcc $^ -o $@ 

.PHONY:
	dump	

clean:
	@rm $(OBJS) $(PROGRAM)

