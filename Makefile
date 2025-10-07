CXX = g++
CXXFLAGS = -Iinclude -Wall -Wextra -std=c++17

SRC_DIR = src
OBJ_DIR = build
BIN_DIR = bin
LIB_DIR = lib

LIB_NAME = libcalc.a
EXEC = calculator_app

SRCS = $(SRC_DIR)/calculator.cpp $(SRC_DIR)/main.cpp
OBJS = $(OBJ_DIR)/calculator.o $(OBJ_DIR)/main.o

all: dirs $(LIB_DIR)/$(LIB_NAME) $(BIN_DIR)/$(EXEC)

dirs:
	mkdir -p $(OBJ_DIR) $(BIN_DIR) $(LIB_DIR)

$(OBJ_DIR)/calculator.o: $(SRC_DIR)/calculator.cpp include/calculator.h
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJ_DIR)/main.o: $(SRC_DIR)/main.cpp include/calculator.h
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(LIB_DIR)/$(LIB_NAME): $(OBJ_DIR)/calculator.o
	ar rcs $@ $^

$(BIN_DIR)/$(EXEC): $(OBJ_DIR)/main.o $(LIB_DIR)/$(LIB_NAME)
	$(CXX) $^ -o $@

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR) $(LIB_DIR)

.PHONY: all clean dirs
