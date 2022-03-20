Class {
	#name : #DeTrabajo,
	#superclass : #Solicitud,
	#instVars : [
		'aptitudNecesaria'
	],
	#category : #FAI2738
}

{ #category : #'as yet unclassified' }
DeTrabajo class >> crear: unaAptitudNecesaria numeroIdentificatorio: unNumeroIdentificatorio fecha: unaFecha monto: unMonto pendiente: esPendiente tiempoValidez: unTiempo [
|deTrabajo|
deTrabajo := self new.
deTrabajo inicializar: unaAptitudNecesaria numeroIdentificatorio: unNumeroIdentificatorio fecha: unaFecha monto: unMonto pendiente: esPendiente tiempoValidez: unTiempo.
^ deTrabajo.
]

{ #category : #Getters }
DeTrabajo >> getAptitudNecesaria [

	^ aptitudNecesaria
]

{ #category : #'as yet unclassified' }
DeTrabajo >> inicializar: unaAptitudNecesaria numeroIdentificatorio: unNumeroIdentificatorio fecha: unaFecha monto: unMonto pendiente: esPendiente tiempoValidez: unTiempo [

	self inicializar:  unNumeroIdentificatorio fecha: unaFecha monto: unMonto pendiente: esPendiente tiempoValidez: unTiempo.
	aptitudNecesaria := unaAptitudNecesaria
]

{ #category : #Aplicacion }
DeTrabajo >> quienSatisface: colPostulantes [

	| colSatisfactorios |
	colSatisfactorios := OrderedCollection new.
	colPostulantes do: [ :postulante | 
		postulante esPersona ifTrue: [ 
			(postulante leCorresponde: aptitudNecesaria) ifTrue: [ 
				colSatisfactorios add: postulante  ] ] ].
	^ colSatisfactorios 
]

{ #category : #Setters }
DeTrabajo >> setAptitudNecesaria: anObject [

	aptitudNecesaria := anObject
]
