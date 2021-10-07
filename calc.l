%{
    /* DEFINIÇÕES EM C */
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
%}
    
/* DEFINIÇÕES REGULARES */

/* Início e fim do programa */
INI "init"
END "end"

/* Leitura e escrita */
WRITE "write"
READ "read"

/* Letras e números */
LETRAS [a-zA-Z]+
NUM_INT [0-9]+
NUM [0-­9]+\.?[0-9]*

/* Variáveis */
VAR {LETRAS}({LETRAS}|{NUM_INT}|"_")*

/* Comentários */
COMMENT1 "!!".*
COMMENT2 "!""*"(.|\n)*"*""!"

/* Caracteres inválidos */
INVALID .

/* SQRT quadrada */
SQRT "sqrt"
%%
    
    /* DEFINIÇÕES DE TOKENS */
[-+()=/*^] {
    return *yytext;
}

{INI} {
    return INI;
}

{END} {
    return END;
}

{WRITE} {
    return WRITE;
}

{READ} {
    return READ;
}

{VAR} {
    yylval.integer = *yytext - 'a';
    return VAR;
}

{NUM} {
    yylval.real = atof(yytext);
    return NUM;
}

{SQRT} {
    return SQRT;
}

{COMMENT1} {;}
{COMMENT2} {;}
{INVALID} {;}
 
[\ \n\t]* {;}

%%

