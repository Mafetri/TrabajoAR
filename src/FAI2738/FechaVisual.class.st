Class {
	#name : #FechaVisual,
	#superclass : #BorderedMorph,
	#instVars : [
		'fecha',
		'fechaVisual',
		'bSiguienteDia'
	],
	#category : #FAI2738
}

{ #category : #'as yet unclassified' }
FechaVisual >> inicializar: gestorEmpleos [

	self bounds: (self position extent: (550@30)).
	self position: self position + (0@700).

	fecha := Fecha new inicializar.
	fecha addDependent: self.
	
	fechaVisual := TextMorph new.
	fechaVisual contents: fecha getFecha asString.
	fechaVisual position: self position + (0@700).
	
	bSiguienteDia := BotonAccion new.
	bSiguienteDia label: 'Siguiente dia'.
	bSiguienteDia mouseAction: [ fecha siguienteDia. gestorEmpleos iniciarDiaFechaActual: fecha. ].
	bSiguienteDia position: fechaVisual position + (200@0).
	
	self addMorph: fechaVisual.
	self addMorph: bSiguienteDia.
	
]

{ #category : #'as yet unclassified' }
FechaVisual >> inicializar: gestorEmpleos posicion: posicion [.

	self position: posicion.
	self bounds: (self position extent: (550@30)).
	self position: self position + (0@670).
	self borderStyle: (RoundedBorderStyle new
                                    cornerRadius: 6;
                                    width: 2;
                                    baseColor: Color black).

	fecha := Fecha new inicializar.
	fecha addDependent: self.
	
	fechaVisual := TextMorph new.
	fechaVisual contents: fecha getFecha asString.
	fechaVisual position: self position + (150@5).
	
	bSiguienteDia := BotonAccion new.
	bSiguienteDia label: 'Siguiente dia'.
	bSiguienteDia mouseAction: [ fecha siguienteDia. gestorEmpleos iniciarDiaFechaActual: fecha. ].
	bSiguienteDia position: fechaVisual position + (150@0).
	bSiguienteDia color: Color transparent.
	bSiguienteDia borderStyle: (RoundedBorderStyle new
                                    cornerRadius: 2;
                                    width: 1;
                                    baseColor: Color black).
	
	self addMorph: fechaVisual.
	self addMorph: bSiguienteDia.
	
]

{ #category : #updating }
FechaVisual >> update: unaFecha [.

	unaFecha ifNotNil: [ fechaVisual contents: unaFecha getFecha asString ].

]
