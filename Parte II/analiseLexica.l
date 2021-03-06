%{

%}

%%

"--"                      {BEGIN(comentario);}
<comentario>\n            {BEGIN(INITIAL); linhaCount++;}
<comentario>.             {}
{LINHA}                   {linhaCount++;}
[ \t]+                    {}
if                  {return TIF;}
then                {return TTHEN;}
endif               {return TENDIF;}
while               {return TWHILE;}
endwhile            {return TENDWHILE;}
do                  {return TDO;}
enddo               {return TENDDO;}
read                {return TREAD;}
write               {return TWRITE;}
"+"                 {return TSUM;}
"*"                 {return TMUL;}
"-"                 {return TSUB;}
"/"                 {return TDIV;}
{DIGITO}+{LETRA}+         {printf("ERRO NA LINHA %d (IDENTIFICADOR %s MAL FORMADO)\n_________________________________\n", linhaCount,yytext);}
{DIGITO}+                 {printf("%d\t| TNUM\t\t| %s\n_________________________________\n", linhaCount, yytext);}
{LETRA}[a-zA-Z0-9]*       {printf("%d\t| TID\t\t| %s\n_________________________________\n",linhaCount, yytext);}
"("                 {return TOPP;}
")"                 {return TCLP;}
";"                 {return TSEM;}
"="                 {return TEQ;}
":="                {return TASSIGN;}
"<"                 {return TSMA;}
">"                 {return TBIG;}
.                         {printf("ERRO NA LINHA: %d SÍMBOLO %s DESCONHECIDO\n_________________________________\n",linhaCount,yytext);}
%%
