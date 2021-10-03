CC = gcc
SRC = $(wildcard ./*.c)
CFLAGS += -std=gnu11  -fPIC -O3
all : main cross_core
OBJ = micro.o


main : main.c ${OBJ}
	$(CC) ${CFLAGS} $^ -o $@ -lm


cross_core: cross_core.c ${OBJ}
	$(CC) ${CFLAGS} $^ -o $@ -lm

%.o: %.c %.h
	${CC} ${CFLAGS} -c -o $@ $<



clean:
	rm -f *.o