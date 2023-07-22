OBJECTS= ./build/compiler.o ./build/lex_process.o ./build/lexer.o ./build/parser.o ./build/node.o ./build/token.o ./build/cprocess.o ./build/helpers/buffer.o ./build/helpers/vector.o
INCLUDES= -I./

all: make_dirs ${OBJECTS}
	gcc -g ${INCLUDES} main.c ${OBJECTS} -o ./main

.PHONY: make_dirs
make_dirs:
	mkdir -vp ./build/helpers

./build/compiler.o: compiler.c
	gcc -g ${INCLUDES} compiler.c -o ./build/compiler.o -c

./build/cprocess.o: cprocess.c
	gcc -g ${INCLUDES} cprocess.c -o ./build/cprocess.o -c

./build/helpers/buffer.o: ./helpers/buffer.c
	gcc -g ${INCLUDES} ./helpers/buffer.c -o ./build/helpers/buffer.o -c

./build/helpers/vector.o: ./helpers/vector.c
	gcc -g ${INCLUDES} ./helpers/vector.c -o ./build/helpers/vector.o -c

./build/lex_process.o: lex_process.c
	gcc -g ${INCLUDES} lex_process.c -o ./build/lex_process.o -c

./build/lexer.o: lexer.c
	gcc -g ${INCLUDES} lexer.c -o ./build/lexer.o -c

./build/parser.o: parser.c
	gcc -g ${INCLUDES} parser.c -o ./build/parser.o -c

./build/node.o: node.c
	gcc -g ${INCLUDES} node.c -o ./build/node.o -c

./build/token.o: token.c
	gcc -g ${INCLUDES} token.c -o ./build/token.o -c


clean:
	rm -f ./main
	rm -f ${OBJECTS}
