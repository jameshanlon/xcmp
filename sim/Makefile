CFLAGS=-O3

.PHONY: clean

xfastsim: xfastsim1.c $(OBJS)
	gcc $(CFLAGS) $^ -o $@ 

clean:
	rm -f xfastsim

