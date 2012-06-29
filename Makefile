PROGRAM=xfastsim
CFLAGS=-O4 -g
OBJS=

all: $(PROGRAM)

# Rules for generating object files (.o).
%.o:%.c
	gcc $(CFLAGS) -c $< -o $@
            
# Rules for generating the executables.
$(PROGRAM): xfastsim1.c $(OBJS)
	@echo 'Generating executable ...'
	gcc $(CFLAGS) $^ -o $@ 

.PHONY:
	dump	

clean:
	@rm $(OBJS) $(PROGRAM)

