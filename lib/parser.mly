%token LAMBDA DOT
%token <string> ID
%token IN
%token EQUAL
%token LET
%token LP RP
%token EOF
%right LP ID LAMBDA LET

%start program
%type <Syntax.tm> program

%%

program: exp EOF { $1 }

exp :
	| exp atom { Syntax.App ($1, $2) }
    | atom { $1 }
	;

atom :
    | ID { Syntax.Var ($1) }
	| LP exp RP { $2 }
	| LAMBDA ID DOT exp %prec LP{ Syntax.Lam ($2, $4) }
	| LET ID EQUAL exp IN exp %prec LP{ Syntax.App (Syntax.Lam ($2, $6), $4) }
    ;
%%
