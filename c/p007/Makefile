CC = gcc
CFLAGS = -lm
OBJS = p007.o structs.o prime.o

p007: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o p007
	rm *.o

p007.o: p007.c
	$(CC) $(CFLAGS) -c p007.c

structs.o: ../libs/structs.c
	$(CC) $(CFLAGS) -c ../libs/structs.c

prime.o: ../libs/prime.c
	$(CC) $(CFLAGS) -c ../libs/prime.c

.PHONY: p007
