Class {
	#name : #PersonaVisual,
	#superclass : #PostulanteVisual,
	#instVars : [
		'nombreCompleto',
		'colAptitudes'
	],
	#category : #FAI2738
}

{ #category : #'as yet unclassified' }
PersonaVisual class >> crear: persona [ 

	|personaVisual|
	personaVisual := self new.
	personaVisual inicializar: persona.
	^personaVisual.
]

{ #category : #'as yet unclassified' }
PersonaVisual >> inicializar: persona [
	
	self color: Color darkGray.
	self bounds: (self position extent: 1000@90).
	
	"---- Nombre Completo ----"
	nombreCompleto := TextMorph new.
	nombreCompleto contents: persona getNombreCompleto.
	
	"---- Col Aptitudes ----"
	colAptitudes := TextMorph new.
	persona getColAptitudes ifEmpty: [ colAptitudes contents: 'No tiene.' ] ifNotEmpty: [ colAptitudes contents: (persona getColAptitudes inject: '' into: [ :string :aptitud | string , aptitud asString , ', '])].
	colAptitudes position: nombreCompleto position + (150@0).
	
	"---- Visual ----"
	self addMorph: nombreCompleto.
	self addMorph: colAptitudes.
	self inicializar: persona posicion: colAptitudes position + (200@0).
	

]

{ #category : #'as yet unclassified' }
PersonaVisual >> inicializarVertical: persona [

	| nombreTitulo aptitudesTitulo |
	
	self color: Color darkGray.
	self bounds: (self position extent: 650@90).
	
	"---- Nombre Completo ----"
	nombreCompleto := TextMorph new.
	nombreTitulo := TextMorph new.
	nombreTitulo contents: 'Nombre: '.
	nombreCompleto contents: persona getNombreCompleto.
	nombreCompleto position: nombreTitulo position + (80@0).
	
	"---- Col Aptitudes ----"
	colAptitudes := TextMorph new.
	aptitudesTitulo := TextMorph new.
	aptitudesTitulo contents: 'Aptitudes: '.
	aptitudesTitulo position: nombreTitulo position + (0@20).
	persona getColAptitudes ifEmpty: [ colAptitudes contents: 'No tiene.' ] ifNotEmpty: [ colAptitudes contents: (persona getColAptitudes inject: '' into: [ :string :aptitud | string , aptitud asString , ', '])].
	colAptitudes position: aptitudesTitulo position + (80@0).
	
	"---- Visual ----"
	self addMorph: nombreCompleto.
	self addMorph: colAptitudes.
	self addMorph: nombreTitulo.
	self addMorph: aptitudesTitulo.
	self inicializarVertical: persona posicion: aptitudesTitulo position.
]
