Class {
	#name : #EmpresaSolicitanteVisual,
	#superclass : #EmpresaVisual,
	#instVars : [
		'colSolicitudesVisuales',
		'colSolicitudesResueltasVisuales',
		'colSolicitudesInvalidasVisuales',
		'bMasInfo',
		'bSolicitudTrabajo',
		'bSolicitudServicio'
	],
	#category : #FAI2738
}

{ #category : #'as yet unclassified' }
EmpresaSolicitanteVisual class >> crear: empresa [
	
	|empresaVisual|
	empresaVisual := self new.
	empresaVisual inicializar: empresa.
	^empresaVisual.
]

{ #category : #'as yet unclassified' }
EmpresaSolicitanteVisual >> inicializar: empresa [

	| colSolicitudes input colDatos |
	self color: Color darkGray.
	self bounds: (self position extent: 900 @ 90).
	empresa addDependent: self.

	nombre := TextMorph new.
	nombre contents: empresa getNombre.

	" ---- Colección Solicitudes ---- "
	colSolicitudesVisuales := TextMorph new.
	colSolicitudes := empresa getColSolicitudesIDString.
	colSolicitudes
		ifEmpty: [ colSolicitudesVisuales contents: 'No tiene.' ]
		ifNotEmpty: [ colSolicitudesVisuales contents: colSolicitudes ].
	colSolicitudesVisuales position: nombre position + (120 @ 0).

	" ---- Colección Solicitudes Resueltas ---- "
	colSolicitudesResueltasVisuales := TextMorph new.
	colSolicitudes := empresa getColSolicitudesResueltasIDString.
	colSolicitudes
		ifEmpty: [ colSolicitudesResueltasVisuales contents: 'No tiene.' ]
		ifNotEmpty: [ 
		colSolicitudesResueltasVisuales contents: colSolicitudes ].
	colSolicitudesResueltasVisuales position:
		colSolicitudesVisuales position + (120 @ 0).

	" ---- Colección Solicitudes Invalidas ---- "
	colSolicitudesInvalidasVisuales := TextMorph new.
	colSolicitudes := empresa getColSolicitudesInvalidasIDString.
	colSolicitudes
		ifEmpty: [ colSolicitudesInvalidasVisuales contents: 'No tiene.' ]
		ifNotEmpty: [ 
		colSolicitudesInvalidasVisuales contents: colSolicitudes ].
	colSolicitudesInvalidasVisuales position:
		colSolicitudesResueltasVisuales position + (120 @ 0).

	" ---- Mas Info ---- "
	bMasInfo := BotonAccion new.
	bMasInfo label: 'Mas info'.
	bMasInfo mouseAction: [ 
		(EmpresaVisual new inicializarVertical: empresa) 
			openInWindowLabeled: empresa getNombre ].
	bMasInfo color: Color black.
	bMasInfo position:
		colSolicitudesInvalidasVisuales position + (120 @ 0).

	" ---- Registrar DeTrabajo ---- "
	colDatos := OrderedCollection new.
	bSolicitudTrabajo := BotonAccion new.
	bSolicitudTrabajo label: 'Registrar Solicitud'.
	bSolicitudTrabajo position: bMasInfo position + (70 @ 0).
	bSolicitudTrabajo mouseAction: [ 
		input := UIManager default request:
			         'Ingresar datos de la siguiente manera: numeroIdentificatorio;monto;tiempoValidez;aptitudNecesaria'.
		input ifNotNil: [ 
			colDatos := input splitOn: ';'.
			empresa agregarSolicitud: (DeTrabajo
					 crear: (colDatos at: 4) asString
					 numeroIdentificatorio: (colDatos at: 1) asInteger
					 fecha: Date today
					 monto: (colDatos at: 2) asInteger
					 pendiente: true
					 tiempoValidez: (colDatos at: 3) asInteger) ] ].


	" ---- Registrar DeServicio ---- "
	bSolicitudServicio := BotonAccion new.
	bSolicitudServicio label: 'Registrar Solicitud'.
	bSolicitudServicio position: bSolicitudTrabajo position + (120 @ 0).
	bSolicitudServicio mouseAction: [ 
		input := UIManager default request:
			         'Ingresar datos de la siguiente manera: numeroIdentificatorio;monto;tiempoValidez;caracteristicas;frecuenciaDePago;duracion;tipoDuracion;producto'.
		input ifNotNil: [ 
			colDatos := input splitOn: ';'.
			empresa agregarSolicitud: (DeServicio
					 crear: (colDatos at: 4)
					 frecuenciaDePago: (colDatos at: 5)
					 duracion: (colDatos at: 6) asInteger
					 tipoDuracion: (colDatos at: 7)
					 producto: (((colDatos at: 8) = '-')
							  ifTrue: [ nil ]
							  ifFalse: [ colDatos at: 8 ])
					 numeroIdentificatorio: (colDatos at: 1) asInteger
					 fecha: Date today
					 monto: (colDatos at: 2) asInteger
					 pendiente: true
					 tiempoValidez: (colDatos at: 3) asInteger) ] ].

	self addMorph: nombre.
	self addMorph: colSolicitudesVisuales.
	self addMorph: colSolicitudesResueltasVisuales.
	self addMorph: colSolicitudesInvalidasVisuales.
	self addMorph: bMasInfo.
	self addMorph: bSolicitudTrabajo.
	self addMorph: bSolicitudServicio
]

{ #category : #updating }
EmpresaSolicitanteVisual >> update: empresa [

	| colSolicitudes  |
	empresa ifNotNil: [ 
		colSolicitudes := empresa getColSolicitudesIDString.
		colSolicitudes
			ifEmpty: [ colSolicitudesVisuales contents: 'No tiene.' ]
			ifNotEmpty: [ colSolicitudesVisuales contents: colSolicitudes ].
		colSolicitudes := empresa getColSolicitudesResueltasIDString.
		colSolicitudes
			ifEmpty: [ colSolicitudesResueltasVisuales contents: 'No tiene.' ]
			ifNotEmpty: [ 
			colSolicitudesResueltasVisuales contents: colSolicitudes ].
		colSolicitudes := empresa getColSolicitudesInvalidasIDString.
		colSolicitudes
			ifEmpty: [ colSolicitudesInvalidasVisuales contents: 'No tiene.' ]
			ifNotEmpty: [ 
			colSolicitudesInvalidasVisuales contents: colSolicitudes ] ]
]
