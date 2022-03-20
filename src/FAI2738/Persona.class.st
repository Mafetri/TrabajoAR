Class {
	#name : #Persona,
	#superclass : #Postulante,
	#instVars : [
		'nombreCompleto',
		'colAptitudes'
	],
	#classInstVars : [
		'maxPesos'
	],
	#category : #FAI2738
}

{ #category : #'as yet unclassified' }
Persona class >> crear: nombre aptitudes: aptitudes direccion: unaDireccion contacto: unContacto [

	| persona |
	persona := self new.
	persona inicializar: nombre aptitudes: aptitudes direccion: unaDireccion contacto: unContacto.
	^ persona
]

{ #category : #'as yet unclassified' }
Persona class >> getMaxPesos [
	^maxPesos 
]

{ #category : #initialization }
Persona class >> setMaxPesos: pesos [
maxPesos := pesos
]

{ #category : #Aplicacion }
Persona >> esPersona [
^true
]

{ #category : #Getters }
Persona >> getColAptitudes [

	^ colAptitudes
]

{ #category : #Getters }
Persona >> getNombre [

	^ nombreCompleto
]

{ #category : #Getters }
Persona >> getNombreCompleto [

	^ nombreCompleto
]

{ #category : #Aplicacion }
Persona >> getPuntual [
	^false.
]

{ #category : #'as yet unclassified' }
Persona >> inicializar: unNombreCompleto aptitudes: aptitudes direccion: unaDireccion contacto: unContacto [

	self inicializar: unaDireccion contacto: unContacto.
	nombreCompleto := unNombreCompleto.
	colAptitudes := aptitudes.
]

{ #category : #Aplicacion }
Persona >> leCorresponde: aptitud [

	^ colAptitudes anySatisfy: [ :apt | apt = aptitud ]
]

{ #category : #Aplicacion }
Persona >> maximoPesos: monto [
^ self class getMaxPesos >= monto
]

{ #category : #Setters }
Persona >> setColAptitudes: anObject [

	colAptitudes := anObject
]

{ #category : #Setters }
Persona >> setNombreCompleto: anObject [

	nombreCompleto := anObject
]

{ #category : #Aplicacion }
Persona >> vendeProduto: unProducto [
^false.
]
