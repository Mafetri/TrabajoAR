Class {
	#name : #Postulante,
	#superclass : #Object,
	#instVars : [
		'direccion',
		'contacto'
	],
	#category : #FAI2738
}

{ #category : #'as yet unclassified' }
Postulante >> chequearPuntualidad: puntualidad [
	
	^ true
]

{ #category : #Getters }
Postulante >> getContacto [

	^ contacto
]

{ #category : #Getters }
Postulante >> getDireccion [

	^ direccion
]

{ #category : #Aplicacion }
Postulante >> haceFraude: numeroIdentificatorio [

	^ false
]

{ #category : #'as yet unclassified' }
Postulante >> inicializar: unaDireccion contacto: unContacto [
	direccion := unaDireccion.
	contacto := unContacto
]

{ #category : #Setters }
Postulante >> setContacto: anObject [

	contacto := anObject
]

{ #category : #Setters }
Postulante >> setDireccion: anObject [

	direccion := anObject
]
