SRC = batterystatus.c
OBJ = ${SRC:.c=}

all: comp

comp:
	gcc $(SRC) -o ${OBJ}

install:
	cp $(OBJ) /usr/local/bin/