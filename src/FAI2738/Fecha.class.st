Class {
	#name : #Fecha,
	#superclass : #Object,
	#instVars : [
		'fecha'
	],
	#category : #FAI2738
}

{ #category : #Getters }
Fecha >> getFecha [ 

	^fecha.
]

{ #category : #'as yet unclassified' }
Fecha >> inicializar [
	
	fecha := Date today.
]

{ #category : #'as yet unclassified' }
Fecha >> inicializar: unaFecha [
	
	fecha := unaFecha.
]

{ #category : #Getters }
Fecha >> setFecha: unaFecha [

	fecha := unaFecha.
]

{ #category : #'as yet unclassified' }
Fecha >> siguienteDia [

	fecha := fecha addDays: 1.

	self changed.
]
