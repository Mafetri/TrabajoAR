Class {
	#name : #Solicitud,
	#superclass : #Object,
	#instVars : [
		'numeroIdentificatorio',
		'fecha',
		'monto',
		'pendiente',
		'tiempoValidez'
	],
	#category : #FAI2738
}

{ #category : #Aplicacion }
Solicitud >> chequearValidez [

	^ (fecha addDays: tiempoValidez) isAfter: Date today.
]

{ #category : #Aplicacion }
Solicitud >> chequearValidezFechaActual: fechaActual [

	^ (fecha addDays: tiempoValidez-1) isAfter: fechaActual getFecha.
]

{ #category : #'as yet unclassified' }
Solicitud >> esFecha: unaFecha [
	^ fecha = unaFecha
]

{ #category : #Aplicacion }
Solicitud >> esIgual: unNumeroIdentificatorio [

	^ numeroIdentificatorio = unNumeroIdentificatorio
]

{ #category : #Getters }
Solicitud >> getFecha [

	^ fecha
]

{ #category : #Getters }
Solicitud >> getMonto [

	^ monto
]

{ #category : #Getters }
Solicitud >> getNumeroIdentificatorio [

	^ numeroIdentificatorio
]

{ #category : #Getters }
Solicitud >> getPendiente [

	^ pendiente
]

{ #category : #Getters }
Solicitud >> getTiempoValidez [

	^ tiempoValidez
]

{ #category : #'as yet unclassified' }
Solicitud >> inicializar:  unNumeroIdentificatorio fecha: unaFecha monto: unMonto pendiente: esPendiente tiempoValidez: unTiempo [

	numeroIdentificatorio:= unNumeroIdentificatorio.
	fecha := unaFecha.
	monto:= unMonto.
	pendiente:= esPendiente.
	tiempoValidez:= unTiempo.
]

{ #category : #Setters }
Solicitud >> setFecha: anObject [

	fecha := anObject
]

{ #category : #Setters }
Solicitud >> setMonto: anObject [

	monto := anObject
]

{ #category : #Setters }
Solicitud >> setNumeroIdentificatorio: anObject [

	numeroIdentificatorio := anObject
]

{ #category : #Setters }
Solicitud >> setPendiente: anObject [

	pendiente := anObject
]

{ #category : #Setters }
Solicitud >> setTiempoValidez: anObject [

	tiempoValidez := anObject
]
