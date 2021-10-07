%{
    /* DEFINIÇÕES EM C */
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <math.h>

    float var[26];

    int yylex();
    void yyerror (char *s){
        printf("%s\n", s);
    }
%}

%union {
    float real;
    int integer;
}

/* TOKENS */

%token <real> NUM
%token <integer> VAR
%token INI
%token END
%token WRITE
%token READ
%token SQRT

%type <real> exp
%type <real> value

/* PRECEDÊNCIA DE OPERADORES */

%left '+' '-'
%left '*' '/'
%right '^'
%left ')'
%right '('

%%

prog: INI cod END 
    ;

cod: cod cmdos
    |
    ;

cmdos: WRITE '(' exp ')'{
        printf ("%.2f\n",$3);
    }
    |
    READ '(' VAR ')' {
        scanf("%f",&var[$3]);
    }
    |
    VAR '=' exp {
       var[$1] = $3;
    }
    ;

exp: exp '+' exp {
        $$ = $1 + $3;
    }
    | exp '-' exp {
        $$ = $1 - $3;
    }
    | exp '*' exp {
        $$ = $1 * $3;   
    }
    | exp '/' exp {
        $$ = $1 / $3;   
    }
    | value {
        $$ = $1;
    }
    | VAR {
        $$ = var[$1];
    }
    ;

value: NUM {
        $$ = $1;
    }
    ;
%%

#include "lex.yy.c"
int main(){
    yyin=fopen("exemplo.k","r");
    yyparse();
    yylex();
    fclose(yyin);
    return 0;
}