header {
	package sticky;
}

class Analex extends Lexer;
	options {
		k=2;
		importVocab=Anasint;
		exportVocab=Analex;
	}
	
	tokens {
		ENTERO= "int";
		REAL= "real";
	
		//Variables
		VAR="var";
		SUP="sup";
		
	    //Bucles
	    B_FOR="para"; 
	    B_WHILE="mientras";
	    
	    //Estructuras condicionales
	    IF="si";
	    ELSE="sino";
	    SWITCH="opcion";
	    CASE="caso";
	    END_CASE="fincaso";
	    DEFAULT="defecto"; 
 
		//Movimientos Stickman
		GIRAR="girar";
		FLEXIONAR="flexionar";
		CABEZA="CABEZA";
		BRAZO="BRAZO";
		PIERNA="PIERNA";
		STICKMAN="STICKMAN";
		IZQ="IZQ";
		DER="DER";
		
		//Inclusion de codigo
		INCLUIR="incluir";
		
		//Impresión por pantalla
		IMPRIMIR="mostrar";
		
		//Definicion de funciones
		//	DEF="def";

				
	}

	//Salto de linea
	protected NL: ('\n' |
		("\r\n")=>
			"\r\n" |
			'\r')
		{newline();};

	//Blancos
	BLANCO: (' '|'\t'|NL) {$setType(Token.SKIP);};

	//Comentarios
	COMENTARIO: (COM_LINEA|COM_BLOQUE) {$setType(Token.SKIP);};
	COM_LINEA: "//" (~('\n'|'\r'))*;
	COM_BLOQUE: "/*" (options {greedy=false;}: ~('\n'|'\r')|NL)* "*/";
	
	//Fin de instruccion
	FIN_INSTRUCCION: ';';
	FIN_INTERPRETE: '$';
	
	//Parentesis
	PAR_IZQ: '(';
	PAR_DER: ')';
	
	//Separador
	SEPARA: ',';
	VERDADERO : "VERDAD";
	FALSO : "FALSO";
	
	//Javi: Dos Puntos
	DOBLE_PUNTO: ':'; 
	
	//Llaves
	LLAVE_IZQ: '{';
	LLAVE_DER: '}';
	
	//Operadores aritmeticos
	OP_SUM: '+';
	OP_RES: '-';
	OP_MUL: '*';
	OP_DIV: '/';
	OP_INC: "++";
	OP_DEC: "--";
	OP_MOD: '%';
	OP_POT: '^';
	OP_RAIZ: "raiz";
	
	//Operadores de asignacion
	OP_ASIG: '=';
		
	//Operadores condicionales
	OP_MAYOR: '>';
	OP_MENOR: '<';
	OP_IG: "==";
	OP_DIST: "!=";
	OP_OX : "OX";
	OP_NO : "NO"; 
	OP_Y : 'Y';
	OP_O : 'O';


	//Identificadores
	protected LETRA: 'a'..'z'|'A'..'Z';
	protected DIGITO: '0'..'9';
	IDENT: (LETRA|'_') (LETRA|'_'|DIGITO)*;

	//Numeros
	NUMERO: ( (DIGITO )+ '.' ) => (DIGITO )+ '.' ( DIGITO )* { $setType (REAL); } | ( DIGITO )+ { $setType (ENTERO);};
			
	//Cadenas
	CADENA: '"' (options {greedy=false;}: ~('\\') | "\\\"")* '"';
	