%option noyywrap
%{
	#include<stdio.h>
	#include "anbn.tab.h"
%}

%%
'a' {return 'a';}
'b' {return 'b';}
. {return yytext[0];}
\n {return 0;}
%%
