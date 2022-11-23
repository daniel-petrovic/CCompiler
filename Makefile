OBJECTS= ./build/compiler.o ./build/lex_process.o ./build/lexer.o ./build/cprocess.o ./build/helpers/buffer.o ./build/helpers/vector.o
INCLUDES= -I./

all: ${OBJECTS}
	gcc -g ${INCLUDES} main.c ${OBJECTS} -o ./main

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


clean:
	rm -f ./main
	rm -f ${OBJECTS}
