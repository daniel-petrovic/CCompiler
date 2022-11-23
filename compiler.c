#include "compiler.h"

struct lex_process_functions compiler_lex_process_functions = {
    .next_char = compile_process_next_char,
    .peek_char  = compile_process_peek_char,
    .push_char = compile_process_push_char
};

int compile_file(const char* filename, const char *out_filename, int flags)
{
    struct compile_process* compile_process = compile_process_create(filename, out_filename, flags);
    if (!compile_process) {
        return COMPILER_FAILED_WITH_ERRORS;
    }

    // Perform lexical analysis
    struct lex_process* lex_process = lex_process_create(compile_process, &compiler_lex_process_functions, NULL);
    if (!lex_process) {
        return COMPILER_FAILED_WITH_ERRORS;
    }

    if (lex(lex_process) != LEXICAL_ANALYSIS_ALL_OK) {
        return COMPILER_FAILED_WITH_ERRORS;
    }
    
    // Perform parsing
    //
    // Perform code generation

    return COMPILER_FILE_COMPILE_OK;
}
