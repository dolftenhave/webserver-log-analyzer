vpath %.h ./include

BUILD_DIR := build
SRC_DIR := src

CC=gcc
CFLAGS=-g -Wall

SRCS = $(wildcard $(SRC_DIR)/*.c)
OBJS = $(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/%.o, $(SRCS))

all: $(OBJS)
	@echo "Completed Succesfully."

$(BUILD_DIR): 
	mkdir -p $(BUILD_DIR)

# Creates a matching .o file in the output directory for every .c file in the source directory. 
# Will also create the build direcory if the build dir does not exist.
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)

.PHONY: help
help: 
	@echo "Run make in the root directory to compile the program.\n Run make clean to clean if you have any issues."
