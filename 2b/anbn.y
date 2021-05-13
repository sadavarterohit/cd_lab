%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
%}


%% 
S:'a'S'b'
|
;
%%

int main()
{
yyparse();
printf("Valid string\n");
return 0;
}

int yyerror()
{
printf("Invalid string\n");
exit(0);
}
