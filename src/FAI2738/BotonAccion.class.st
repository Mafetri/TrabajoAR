Class {
	#name : #BotonAccion,
	#superclass : #SimpleButtonMorph,
	#instVars : [
		'bloque',
		'bloqueAccion'
	],
	#category : #FAI2738
}

{ #category : #'as yet unclassified' }
BotonAccion >> mouseAction: unBloque [
	bloqueAccion := unBloque
]

{ #category : #'event handling' }
BotonAccion >> mouseUp: unEvento [
	super mouseUp: unEvento.
	bloqueAccion value.
]
