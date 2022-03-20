Class {
	#name : #DeTrabajoVisual,
	#superclass : #SolicitudVisual,
	#instVars : [
		'aptitudNecesaria'
	],
	#category : #FAI2738
}

{ #category : #'as yet unclassified' }
DeTrabajoVisual >> inicializar: solicitud [
	
	super inicializar: solicitud.
	
	aptitudNecesaria := TextMorph new.
	aptitudNecesaria contents: solicitud getAptitudNecesaria.
	aptitudNecesaria position: tiempoValidez position + (30@0).
	
	self addMorph: aptitudNecesaria.
]

{ #category : #'as yet unclassified' }
DeTrabajoVisual >> inicializarVertical: solicitud [

	|aptitudNecesariaTitulo|
	
	super inicializarVertical: solicitud.
	
	aptitudNecesaria := TextMorph new.
	aptitudNecesariaTitulo := TextMorph new.
	aptitudNecesariaTitulo contents: 'Aptitud necesaria: '.
	aptitudNecesariaTitulo position: tiempoValidez position + (-130@20).
	aptitudNecesaria contents: solicitud getAptitudNecesaria.
	aptitudNecesaria position: aptitudNecesariaTitulo position + (130@0).
	
	self addMorph: aptitudNecesaria.
	self addMorph: aptitudNecesariaTitulo.
]
