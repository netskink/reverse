
# One difference of this makefile over the others is that it has two targets.
# This means that the makefile must adjust so it only builds the code for 
# each target with the corresponding main routine.

TARGET_1 = hello
TARGET_2 = adds
TARGET_3 = calls
CC = gcc

# Non-Debug No-optimization Flags
#CFLAGS = -Wall -O0
# Debug No-Optimization Flags
CFLAGS = -g -Wall -O0 -m32
# Debug Flags
#CFLAGS = -g -Wall -Og
LFLAGS = -g -Wall -m32
LDFLAGS =  -m32

# Profile Flags
#CFLAGS = -g -Wall -pg
#LFLAGS = -pg 


.PHONY: default all clean test

default: $(TARGET_1) $(TARGET_2) $(TARGET_3)
all: default

# OBJECTS uses the filter-out mechanism above to remove the files which have main routines 
# in them.  The example above was doing it at the object level.
MAINS = main_$(TARGET_1).c main_$(TARGET_2).c main_$(TARGET_3).c
OBJECTS = $(patsubst %.c, %.o, $(filter-out  $(MAINS) , $(wildcard *.c))    ) 
HEADERS = $(wildcard *.h)



%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

.PRECIOUS: $(TARGET_1) $(TARGET_2) $(TARGET_3) $(OBJECTS)

$(TARGET_1): $(OBJECTS) main_$(TARGET_1).o
	$(CC) -o $@  $^ $(LFLAGS) 

$(TARGET_2): $(OBJECTS) main_$(TARGET_2).o
	$(CC) -o $@  $^ $(LFLAGS)

$(TARGET_3): $(OBJECTS) main_$(TARGET_3).o
	$(CC) -o $@  $^ $(LFLAGS)



clean:
	-rm -f *.o
	-rm -f $(TARGET_1)
	-rm -f $(TARGET_2)
	-rm -f $(TARGET_3)

test: all
	./$(TARGET_1) 












