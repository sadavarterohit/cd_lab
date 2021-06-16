%option noyywrap
%{
	#include<stdio.h>
	#include<math.h>
	int p=0, s=0;
%}

%%
"printf" { p++; fprintf(yyout,"writef");}
"scanf" { s++; fprintf(yyout,"readf");}
; {fprintf(yyout,"%s",yytext);}
\n {fprintf(yyout,"\n");};
%%

int main()
{
	yyin=fopen("c.c","r+");
	yyout=fopen("d.c","r+");
	yylex();
	printf("The no. of printf's are %d\n\t\tscanf's are%d\n",p,s);
}
