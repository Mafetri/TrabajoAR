Class {
	#name : #MenuVisual,
	#superclass : #BorderedMorph,
	#instVars : [
		'bCerrar',
		'bMinimizar',
		'origen',
		'estiloBorde',
		'tituloVentana',
		'bordeSuperior'
	],
	#category : #FAI2738
}

{ #category : #'as yet unclassified' }
MenuVisual >> inicializar: gestorEmpleos tamanio: tamanio [

	"===========================  Ventana inicial  ==========================="
	self bounds: (self position extent: tamanio).
	self position: 65 @ 65.
	self color: Color white .
	origen := self innerBounds origin.
	gestorEmpleos addDependent: self.
	estiloBorde := (RoundedBorderStyle new
                                    cornerRadius: 4;
                                    width: 2;
                                    baseColor: Color black).
	self borderStyle: estiloBorde.
	
	"===========================  Barra Titulo  ==========================="
	bordeSuperior := BorderedMorph new.
	bordeSuperior color: Color blue.
	bordeSuperior position: self position.
	bordeSuperior extent: ((tamanio x)@35).
	bordeSuperior borderStyle: estiloBorde.
	self addMorphBack: bordeSuperior.
	
	tituloVentana := TextMorph new.
	tituloVentana position: ((tamanio x)/2)@(self position y + 10).
	self addMorph: tituloVentana.
	
	"===========================  Botones  ==========================="
	"       ----- Creacion ----       "
	bCerrar := BotonAccion new.
	bMinimizar := BotonAccion new.
	
	"       ----- Posición ----       "
	bCerrar position: (origen + (5@5)).
	bMinimizar position: bCerrar position + (45@0).
	
	"       ----- Etiquetado ----       "
	bCerrar label: 'Cerrar'.
	bMinimizar label: 'Minimizar'.

	"       ----- Color ----       "
	bCerrar color: Color red.
	bCerrar borderStyle: estiloBorde.
	bMinimizar color: Color black.
	bMinimizar borderStyle: estiloBorde.
	
	"       ----- Asignacion ----       "
	bCerrar mouseAction: [self delete].
	bMinimizar mouseAction: [ self collapse ].
	
	"       ----- Se muestran ----       "
	self addMorph: bCerrar.
	self addMorph: bMinimizar.

]
