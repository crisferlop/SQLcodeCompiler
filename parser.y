%{
	#include <stdio.h>
	#include <string.h>
	#include <vector>
	long line_counter = 1L;
	std::vector<char*> tablasExistentes;
	std::vector<char*> columnasExistentes;
	short err = 0;
	short debug = 0;
%}

%union{
	char* mystring;
}

%token CREATE
%token TABLE
%token IDENTIFIER
%token END
%token PARENTESIS_IZQUIERDO
%token PARENTESIS_DERECHO
%token DOTCOMA
%token COMA
%token PARENTESIS_CUADRADO_IZQUIERDO
%token PARENTESIS_CUADRADO_DERECHO
%token COLUMN_MODIFIER
%token DATATYPE

%start initial

%%

initial:
	CREATE TABLE IDENTIFIER table DOTCOMA
	| CREATE TABLE IDENTIFIER table DOTCOMA initial
;

table:
	PARENTESIS_IZQUIERDO columnas PARENTESIS_DERECHO
;

columnas:
	IDENTIFIER DATATYPE COLUMN_MODIFIER
	| IDENTIFIER DATATYPE
	| IDENTIFIER DATATYPE COMA columnas
	| IDENTIFIER DATATYPE COLUMN_MODIFIER COMA columnas
;


%%

#include "lex.yy.c"
int main(int argc, char** args){
	if (argc == 3 || argc == 4){
		if (yyin = fopen(args[1],"r")){
			if (argc == 4 && strcmp(args[3],"-d")==0){debug = 1;printf("Debuger encendido\n");}
			else if (argc == 4){
				printf("Error del tercer argumento, solamente se admite \"-d\", sin comillas\n");
				printf("Dicho argumento es para debugear la compilacion\n");
				fclose(yyin);
				return -1;
			}
			yyout = fopen(args[2],"w+");
			fputs("<db>\n",yyout);
			yyparse();
			fputs("</db>",yyout);
			fclose(yyin);
			fclose(yyout);
			if (err){
				remove(args[2]);
				printf("Error de compilacion!\n");
			}else{
				printf("Compilacion terminada con exito!\n");
			}
		}
		else printf("el archivo \"%s\" no existe\n", args[1]);
	}
	else{
		printf("Para compilar debe insertar los argumentos:\n");
		printf("\t1) archivo de entrada\n");
		printf("\t2) archivo de salida\n");
		printf("\t3) -d para debugeo, este argumento es opcional\n");
	}
	return 0;
}
int yyerror(const char* s ) {
	yyerrok;
	fprintf(stderr,"%s: %s at line %ld\n", s, yytext,line_counter);
    	yyclearin;
	err = 1;
//	return err;
}
