CC = gcc
CFLAGS = -lm
OBJS = p010.o structs.o prime.o

p010: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o p010
	rm *.o

p010.o: p010.c
	$(CC) $(CFLAGS) -c p010.c

structs.o: ../libs/structs.c
	$(CC) $(CFLAGS) -c ../libs/structs.c

prime.o: ../libs/prime.c
	$(CC) $(CFLAGS) -c ../libs/prime.c

.PHONY: p010
