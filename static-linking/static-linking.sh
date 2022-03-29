# this bash script is a demo of static linking  
# step 1: compile the source code to object file
CC=clang
CFLAGS="-Wall -g -O0 -std=gnu11"
OBJ_FILE=mylib.o
SRC_FILE=mylib.c
$CC $CFLAGS -c $SRC_FILE -o $OBJ_FILE
# step 2: archive the object file to static library
AR=ar
AR_FLAGS="rvs"
LIB_FILE=libmylib.a
$AR $AR_FLAGS $LIB_FILE $OBJ_FILE
# step 3: link the static library to the executable
$CC $CFLAGS main.c -I . -L . -lmylib -o main
# step 4: run the executable with the -L option and -I option
./main
# clean up
rm $OBJ_FILE
rm $LIB_FILE