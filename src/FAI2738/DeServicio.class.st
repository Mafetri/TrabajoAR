Class {
	#name : #DeServicio,
	#superclass : #Solicitud,
	#instVars : [
		'caracteristicas',
		'frecuenciaDePago',
		'duracion',
		'tipoDuracion',
		'producto'
	],
	#category : #FAI2738
}

{ #category : #'as yet unclassified' }
DeServicio class >> crear: unasCaracteristicas frecuenciaDePago: frecuencia duracion: unaDuracion tipoDuracion: tipo producto: unProducto numeroIdentificatorio: unNumeroIdentificatorio fecha: unaFecha monto: unMonto pendiente: esPendiente tiempoValidez: unTiempo [
|solicitud|
solicitud := self new.
solicitud incializar: unasCaracteristicas frecuenciaDePago: frecuencia duracion: unaDuracion tipoDuracion: tipo producto: unProducto numeroIdentificatorio: unNumeroIdentificatorio fecha: unaFecha monto: unMonto pendiente: esPendiente tiempoValidez: unTiempo.
^solicitud.
]

{ #category : #Getters }
DeServicio >> getCaracteristicas [

	^ caracteristicas
]

{ #category : #Getters }
DeServicio >> getDuracion [

	^ duracion
]

{ #category : #Getters }
DeServicio >> getFrecuenciaDePago [

	^ frecuenciaDePago
]

{ #category : #Getters }
DeServicio >> getProducto [

	^ producto
]

{ #category : #Getters }
DeServicio >> getTipoDuracion [

	^ tipoDuracion
]

{ #category : #'as yet unclassified' }
DeServicio >> incializar: unasCaracteristicas frecuenciaDePago: frecuencia duracion: unaDuracion tipoDuracion: tipo producto: unProducto numeroIdentificatorio: unNumeroIdentificatorio fecha: unaFecha monto: unMonto pendiente: esPendiente tiempoValidez: unTiempo [

	self inicializar:  unNumeroIdentificatorio fecha: unaFecha monto: unMonto pendiente: esPendiente tiempoValidez: unTiempo.
	caracteristicas := unasCaracteristicas.
	frecuenciaDePago := frecuencia.
	duracion := unaDuracion.
	tipoDuracion := tipo.
	producto := unProducto
]

{ #category : #Aplicacion }
DeServicio >> quienSatisface: colPostulantes [

	| vende colSatisfactorios puntualidad |
	colSatisfactorios := OrderedCollection new.
	colPostulantes do: [ :postulante | 
		(postulante haceFraude: numeroIdentificatorio) ifFalse: [ 
			(postulante leCorresponde: caracteristicas) ifTrue: [ 
				(postulante maximoPesos: monto) ifTrue: [ 
					vende := true.
					producto ifNotNil: [ 
						vende := postulante vendeProduto: producto ].
					puntualidad := (postulante chequearPuntualidad: (duracion = 0)).
					(puntualidad and: vende) ifTrue: [ 
						colSatisfactorios add: postulante ] ] ] ] ].

	^ colSatisfactorios
]

{ #category : #Setters }
DeServicio >> setCaracteristicas: anObject [

	caracteristicas := anObject
]

{ #category : #Setters }
DeServicio >> setDuracion: anObject [

	duracion := anObject
]

{ #category : #Setters }
DeServicio >> setFrecuenciaDePago: anObject [

	frecuenciaDePago := anObject
]

{ #category : #Setters }
DeServicio >> setProducto: anObject [

	producto := anObject
]

{ #category : #Setters }
DeServicio >> setTipoDuracion: anObject [

	tipoDuracion := anObject
]
