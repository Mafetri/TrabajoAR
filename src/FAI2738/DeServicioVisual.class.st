Class {
	#name : #DeServicioVisual,
	#superclass : #SolicitudVisual,
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
DeServicioVisual >> inicializar: solicitud [

	super inicializar: solicitud.

	caracteristicas := TextMorph new.
	caracteristicas contents: solicitud getCaracteristicas.
	caracteristicas position: tiempoValidez position + (30 @ 0).

	frecuenciaDePago := TextMorph new.
	frecuenciaDePago contents: solicitud getFrecuenciaDePago.
	frecuenciaDePago position: caracteristicas position + (100 @ 0).

	producto := TextMorph new.
	producto contents: (solicitud getProducto ifNil: [ 'Sin producto' ] ifNotNil: [ solicitud getProducto ]).
	producto position: frecuenciaDePago position + (185 @ 0).

	duracion := TextMorph new.
	duracion position: frecuenciaDePago position + (80 @ 0).
	solicitud getDuracion = 0
		ifTrue: [ duracion contents: 'Puntual' ]
		ifFalse: [ 
			duracion contents: solicitud getDuracion asString.
			tipoDuracion := TextMorph new.
			tipoDuracion contents: solicitud getTipoDuracion.
			tipoDuracion position: duracion position + (15 @ 0).
			producto position: tipoDuracion position + (90 @ 0).
			self addMorph: tipoDuracion ].

	
	

	self addMorph: caracteristicas.
	self addMorph: frecuenciaDePago.
	self addMorph: duracion.
	self addMorph: producto.

]

{ #category : #'as yet unclassified' }
DeServicioVisual >> inicializarVertical: solicitud [

	| caracteristicasTitulo frecuenciaDePagoTitulo duracionTitulo productoTitulo |
	super inicializarVertical: solicitud.

	caracteristicas := TextMorph new.
	caracteristicasTitulo := TextMorph new.
	caracteristicasTitulo contents: 'Caracteristicas: '.
	caracteristicasTitulo position: tiempoValidez position + (-130 @ 20).
	caracteristicas contents: solicitud getCaracteristicas.
	caracteristicas position: caracteristicasTitulo position + (130 @ 0).

	frecuenciaDePago := TextMorph new.
	frecuenciaDePagoTitulo := TextMorph new.
	frecuenciaDePagoTitulo contents: 'Frecuencia de Pago: '.
	frecuenciaDePagoTitulo position:
		caracteristicasTitulo position + (0 @ 20).
	frecuenciaDePago contents: solicitud getFrecuenciaDePago.
	frecuenciaDePago position:
		frecuenciaDePagoTitulo position + (130 @ 0).

	duracion := TextMorph new.
	duracionTitulo := TextMorph new.
	duracionTitulo contents: 'Duracion: '.
	duracionTitulo position: frecuenciaDePagoTitulo position + (0 @ 20).
	duracion position: duracionTitulo position + (130 @ 0).
	solicitud getDuracion = 0
		ifTrue: [ duracion contents: 'Puntual' ]
		ifFalse: [ 
			duracion contents: solicitud getDuracion asString.
			tipoDuracion := TextMorph new.
			tipoDuracion contents: solicitud getTipoDuracion.
			tipoDuracion position: duracion position + (15 @ 0).
			self addMorph: tipoDuracion ].

	producto := TextMorph new.
	productoTitulo := TextMorph new.
	productoTitulo contents: 'Producto: '.
	productoTitulo position: duracionTitulo position + (0 @ 20).
	producto contents: (solicitud getProducto ifNil: [ 'Sin producto' ] ifNotNil: [ solicitud getProducto ]).
	producto position: productoTitulo position + (130 @ 0).

	self addMorph: caracteristicas.
	self addMorph: caracteristicasTitulo.
	self addMorph: frecuenciaDePago.
	self addMorph: frecuenciaDePagoTitulo.
	self addMorph: duracion.
	self addMorph: duracionTitulo.
	self addMorph: producto.
	self addMorph: productoTitulo
]
