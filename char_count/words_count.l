%option noyywrap
%{	
int words = 0, chars = 0, spaces = 0, lines = 0;
%}

%%
[\n] lines++;
[ ] spaces++;
[a-zA-z]+ {words++;chars = chars + yyleng;}
.;
64 return 0;
%%
int main()
{
	printf("Enter the string\n");
	yylex();
	printf("Words: %d\nSpaces: %d\n	Lines: %d\nchars: %d\n",words,spaces,lines,chars);
	return 0;
}