#  demo for how to create and link against dynamic libraries
#  step 1: compile the source code to object file
CC=clang
CFLAGS="-Wall -g -O0 -std=gnu11"
OBJ_FILE=mylib.o
SRC_FILE=mylib.c
$CC $CFLAGS -c $SRC_FILE -o $OBJ_FILE -fPIC
# step 2: turn the object file into a dynamic library
$CC $CFLAGS -shared -Wl,-soname,libmylib.so -o libmylib.so $OBJ_FILE
# step 3: link the dynamic library to the executable 
# we also store the linking information in the executable
# another way to is define environment variables LD_LIBRARY_PATH 
#export LD_LIBRARY_PATH=$PWD  

$CC $CFLAGS main.c -I . -L . -lmylib -o main -Wl,-R .
# step 4: export the dynamic library to the system

./main
# clean up
rm $OBJ_FILE
## the command ldd shows the dependencies of the dynamic library
echo the dependencies of the dynamic library
ldd main