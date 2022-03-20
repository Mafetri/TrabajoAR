Class {
	#name : #PropuestaVisual,
	#superclass : #BorderedMorph,
	#instVars : [
		'nombrePostulante',
		'bPostulante',
		'bSolicitud',
		'idSolicitud',
		'bAceptar'
	],
	#category : #FAI2738
}

{ #category : #'as yet unclassified' }
PropuestaVisual class >> crear: unaPropuesta gestor: gestor [

	|propuestaVisual|
	propuestaVisual := self new.
	propuestaVisual inicializar: unaPropuesta gestor: gestor.
	^propuestaVisual.
]

{ #category : #'as yet unclassified' }
PropuestaVisual >> inicializar: unaPropuesta gestor: gestorEmpleos [

	| postulante solicitud |
	self color: Color darkGray.
	self bounds: (self position extent: 600 @ 90).

	" =========================  Postulante  ========================= "
	postulante := unaPropuesta getPostulante.

	nombrePostulante := TextMorph new.
	nombrePostulante contents: postulante getNombre.

	bPostulante := BotonAccion new.
	bPostulante position: nombrePostulante position + (180 @ 0).
	bPostulante label: 'Mas info'.
	bPostulante mouseAction: [ 
		postulante class == Persona
			ifTrue: [ 
			(PersonaVisual new inicializarVertical: postulante) openInWindowLabeled: ('Persona: ' , postulante getNombreCompleto) ]
			ifFalse: [ 
			(EmpresaVisual new inicializarVertical: postulante) openInWindowLabeled: ('Empresa: ' , postulante getNombre) ] ].

	" =========================  Solicitud  ========================= "
	solicitud := unaPropuesta getSolicitud.

	idSolicitud := TextMorph new.
	idSolicitud contents:
		unaPropuesta getSolicitud getNumeroIdentificatorio asString.
	idSolicitud position: bPostulante position + (100 @ 0).

	bSolicitud := BotonAccion new.
	bSolicitud label: 'Mas info'.
	bSolicitud position: idSolicitud position + (60@0).
	bSolicitud mouseAction: [ 
		solicitud class == DeServicio
			ifTrue: [ 
				(DeServicioVisualEmpresa new inicializarVertical: solicitud empresa: (gestorEmpleos buscarEmpresaSolicitud: solicitud))
					openInWindowLabeled:
					'Solicitud de Servicio: ' , solicitud getNumeroIdentificatorio asString ]
			ifFalse: [ 
				(DeTrabajoVisualEmpresa new inicializarVertical: solicitud empresa: (gestorEmpleos buscarEmpresaSolicitud: solicitud)) 
					openInWindowLabeled:
					'Solicitud de Trabajo: ' , solicitud getNumeroIdentificatorio asString ] ].

	" =========================  Aceptar  ========================= "
	bAceptar := BotonAccion new.
	bAceptar label: 'Aceptar'.
	bAceptar color: Color green.
	bAceptar position: bSolicitud position + (100@0).
	bAceptar mouseAction: [ gestorEmpleos aceptarPropuesta: unaPropuesta ].

	self addMorph: nombrePostulante.
	self addMorph: idSolicitud.
	self addMorph: bSolicitud.
	self addMorph: bPostulante.
	self addMorph: bAceptar.
]
