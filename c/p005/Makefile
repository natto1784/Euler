CC = gcc
CFLAGS = -lm
OBJS = p005.o structs.o prime.o

p005: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o p005
	rm *.o

p005.o: p005.c
	$(CC) $(CFLAGS) -c p005.c

structs.o: ../libs/structs.c
	$(CC) $(CFLAGS) -c ../libs/structs.c

prime.o: ../libs/prime.c
	$(CC) $(CFLAGS) -c ../libs/prime.c

.PHONY: p005
