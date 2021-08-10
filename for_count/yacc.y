%{

#include <stdio.h>
#include <stdlib.h>
int count=0;
extern FILE *yyin;
%}
%token FOR VARIABLE COMP UNARY NUM BIN
%%
s: forloop { printf("Valid statement\n"); }
|
;
forloop: FOR '(' expr ';' expr ';' expr ')' '{'
statements '}' {count++;}
;
expr:
VARIABLE
| NUM
| VARIABLE '=' expr
| expr BIN expr
| expr UNARY
| expr COMP expr
|
;
statements:
statement statements
|
;
statement:
forloop
| expr ';'
;
%%
int yyerror() {
printf("Invalid statement\n");
exit(1);
}
int main(int argc, char* argv[]) {

//yyin = fopen(argv[1], "r");
yyparse();
printf("No. of nested FOR's are: %d\n",count);
return 0;
}