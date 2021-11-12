SRC = random-lyrics.c
OPT = random-lyrics
local_bin = $$HOME/.local/bin/
sys_bin = /usr/local/bin

all:
	gcc $(SRC) -o $(OPT)

install_user:
	mkdir -p $(local_bin)
	cp $(OPT) $(local_bin)

install:
	cp $(OPT) /usr/bin/random-lyrics

help:
	@echo
	@echo -\"install_user\": will copy $(OPT) to $(local_bin). Make sure $(local_bin) is in the PATH environnement variable
	@echo
	@echo -\"install\": will copy $(OPT) to $(sys_bin). You have to run this installation with sudo
	@echo

love:
	@echo "not war <3"
