AS = arm-linux-gnueabihf-as
CC = arm-linux-gnueabihf-gcc

CFLAGS = -g -Wall -Wextra -pedantic -Werror
LDFLAGS=

ALL_LDFLAGS = -pie

ALL_CFLAGS = -std=c99 -fPIE $(CFLAGS)
ALL_LDFLAGS += $(LDFLAGS)

C_OBJS = $(patsubst %.c,%.o,$(wildcard *.c))
AS_OBJS = $(patsubst %.s,%.o,$(wildcard *.s))
ALL_OBJS = $(filter-out example.o,$(C_OBJS) $(AS_OBJS) test-framework/unity.o)

CC_CMD = $(CC) $(ALL_CFLAGS) -c -o $@ $<

all: tests
	qemu-arm -L /usr/arm-linux-gnueabihf ./$<

tests: $(ALL_OBJS)
	@$(CC) $(ALL_CFLAGS) $(ALL_LDFLAGS) -o $@ $(ALL_OBJS)

%.o: %.s
	@$(AS) -o $@ $<

%.o: %.c
	@$(CC_CMD)

test-framework/unity.o: test-framework/unity.c test-framework/unity.h test-framework/unity_internals.h
	@$(CC_CMD)

clean:
	@rm -f *.o test-framework/*.o tests

.PHONY: all clean