Class {
	#name : #SolicitudVisual,
	#superclass : #BorderedMorph,
	#instVars : [
		'numeroIdentificatorio',
		'fecha',
		'monto',
		'pendiente',
		'tiempoValidez'
	],
	#category : #FAI2738
}

{ #category : #'as yet unclassified' }
SolicitudVisual >> inicializar: solicitud [

	self bounds: (self position extent: (700@90)).
	self color: Color darkGray.
	
	numeroIdentificatorio := TextMorph new.
	fecha := TextMorph new.
	monto := TextMorph new.
	pendiente := TextMorph new.
   tiempoValidez := TextMorph new.

	numeroIdentificatorio contents: solicitud getNumeroIdentificatorio asString.
	fecha contents: solicitud getFecha asString.
	monto contents: solicitud getMonto asString.
	pendiente contents: (solicitud getPendiente ifTrue: [ 'Si' ] ifFalse: [ 'No' ]).
	tiempoValidez contents: solicitud getTiempoValidez asString.
	
	fecha position: numeroIdentificatorio position + (60@0).
	monto position: fecha position + (120@0).
	pendiente position: monto position + (60@0).
	tiempoValidez position: pendiente position + (60@0).
	
	self addMorph: numeroIdentificatorio.
 	self addMorph: fecha.
	self addMorph: monto.
	self addMorph: pendiente.
	self addMorph: tiempoValidez.
	
]

{ #category : #'as yet unclassified' }
SolicitudVisual >> inicializarVertical: solicitud [

	|numeroIdentificatorioTitulo fechaTitulo montoTitulo pendienteTitulo tiempoValidezTitulo|
	self bounds: (self position extent: (250@70)).
	self color: Color darkGray.
	
	numeroIdentificatorio := TextMorph new.
	numeroIdentificatorioTitulo := TextMorph new.
	fecha := TextMorph new.
	fechaTitulo := TextMorph new.
	monto := TextMorph new.
	montoTitulo := TextMorph new.
	pendiente := TextMorph new.
	pendienteTitulo := TextMorph new.
   tiempoValidez := TextMorph new.
	tiempoValidezTitulo := TextMorph new.

	numeroIdentificatorio contents: solicitud getNumeroIdentificatorio asString.
	numeroIdentificatorioTitulo contents: 'Numero Identificatorio: '.
	fecha contents: solicitud getFecha asString.
	fechaTitulo contents: 'Fecha: '.
	monto contents: solicitud getMonto asString.
	montoTitulo contents: 'Monto: '.
	pendiente contents: (solicitud getPendiente ifTrue: [ 'Si' ] ifFalse: [ 'No' ]).
	pendienteTitulo contents: 'Pendiente: '.
	tiempoValidez contents: solicitud getTiempoValidez asString.
	tiempoValidezTitulo contents: 'Tiempo Validez: '.
	
	fechaTitulo position: numeroIdentificatorioTitulo position + (0@20).
	montoTitulo position: fechaTitulo position + (0@20).
	pendienteTitulo position: montoTitulo position + (0@20).
	tiempoValidezTitulo position: pendienteTitulo position + (0@20).
	numeroIdentificatorio position: numeroIdentificatorioTitulo position + (130@0).
	fecha position: fechaTitulo position + (130@0).
	monto position: montoTitulo position + (130@0).
	pendiente position: pendienteTitulo position + (130@0).
	tiempoValidez position: tiempoValidezTitulo position + (130@0).
	
	self addMorph: numeroIdentificatorio.
	self addMorph: numeroIdentificatorioTitulo.
 	self addMorph: fecha.
	self addMorph: fechaTitulo.
	self addMorph: monto.
	self addMorph: montoTitulo.
	self addMorph: pendiente.
	self addMorph: pendienteTitulo.
	self addMorph: tiempoValidez.
	self addMorph: tiempoValidezTitulo.
	
]
