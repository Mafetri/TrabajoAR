Class {
	#name : #PostulanteVisual,
	#superclass : #BorderedMorph,
	#instVars : [
		'direccion',
		'contacto'
	],
	#category : #FAI2738
}

{ #category : #'as yet unclassified' }
PostulanteVisual >> inicializar: postulante posicion: posicion [

	self color: Color darkGray.
	direccion := TextMorph new.
	direccion contents: postulante getDireccion.
	direccion position: posicion + (150@0).
	
	contacto := TextMorph new.
	contacto contents: postulante getContacto asString.
	contacto position: direccion position + (150@0).
	
	self addMorph: direccion.
	self addMorph: contacto.
]

{ #category : #'as yet unclassified' }
PostulanteVisual >> inicializarVertical: postulante posicion: posicion [

	|direccionTitulo contactoTitulo|
	self color: Color darkGray.
	direccionTitulo := TextMorph new.
	direccionTitulo contents: 'Dirección: '.
	direccionTitulo position: posicion + (0@20).
	direccion := TextMorph new.
	direccion contents: postulante getDireccion.
	direccion position: direccionTitulo position + (80@0).
	
	contactoTitulo := TextMorph new.
	contactoTitulo contents: 'Contacto: '.
	contactoTitulo position: direccionTitulo position + (0@20).
	contacto := TextMorph new.
	contacto contents: postulante getContacto asString.
	contacto position: contactoTitulo position + (80@0).
	
	self addMorph: direccion.
	self addMorph: contacto.
	self addMorph: direccionTitulo.
	self addMorph: contactoTitulo.
]
