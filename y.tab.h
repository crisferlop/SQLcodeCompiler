#define CREATE 257
#define TABLE 258
#define IDENTIFIER 259
#define END 260
#define PARENTESIS_IZQUIERDO 261
#define PARENTESIS_DERECHO 262
#define DOTCOMA 263
#define COMA 264
#define PARENTESIS_CUADRADO_IZQUIERDO 265
#define PARENTESIS_CUADRADO_DERECHO 266
#define COLUMN_MODIFIER 267
#define DATATYPE 268
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union{
	char* mystring;
} YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
extern YYSTYPE yylval;
