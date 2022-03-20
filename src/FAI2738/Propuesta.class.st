Class {
	#name : #Propuesta,
	#superclass : #Object,
	#instVars : [
		'postulante',
		'solicitud'
	],
	#category : #FAI2738
}

{ #category : #'as yet unclassified' }
Propuesta class >> crear: unPostulante solicitud: unaSolicitud [
|propuesta|
propuesta := self new.
propuesta inicializar: unPostulante solicitud: unaSolicitud.
^propuesta
]

{ #category : #Aplicacion }
Propuesta >> aceptar [

	solicitud setPendiente: false.
	^solicitud
]

{ #category : #Aplicacion }
Propuesta >> esFraudulenta [

^ postulante haceFraude: solicitud getNumeroIdentificatorio.

]

{ #category : #Aplicacion }
Propuesta >> esIgual: unaPropuesta [

^ postulante = unaPropuesta getPostulante and: solicitud = unaPropuesta getSolicitud
]

{ #category : #Getters }
Propuesta >> getPostulante [

	^ postulante
]

{ #category : #Getters }
Propuesta >> getSolicitud [

	^ solicitud
]

{ #category : #'as yet unclassified' }
Propuesta >> inicializar: unPostulante solicitud: unaSolicitud [
postulante := unPostulante.
solicitud := unaSolicitud.
]

{ #category : #Setters }
Propuesta >> setPostulante: anObject [

	postulante := anObject
]

{ #category : #Setters }
Propuesta >> setSolicitud: anObject [

	solicitud := anObject
]
