/*--------------------------------------------------
 * pg_make_title.c
 * -------------------------------------------------
 */
#include "postgres.h"
#include "utils/builtins.h"
#include "c.h"

PG_MODULE_MAGIC;
PG_FUNCTION_INFO_V1(convert_to_title);

Datum
convert_to_title(PG_FUNCTION_ARGS)
{
    char *input = text_to_cstring(PG_GETARG_TEXT_PP(0));

    int new_word = 1;

    for (int i = 0; input[i] != '\0'; i++) {
        if (isspace(input[i])) {
            new_word = 1;
        } else if (new_word && isalpha(input[i])) {
            input[i] = toupper(input[i]);
            new_word = 0;
        } else {
            new_word = 0;
        }
    }

    PG_RETURN_CSTRING(input);
}

