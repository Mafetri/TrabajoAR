Class {
	#name : #EmpresaSolicitante,
	#superclass : #Empresa,
	#instVars : [
		'colSolicitudes',
		'colSolicitudesResueltas',
		'colSolicitudesInvalidas'
	],
	#category : #FAI2738
}

{ #category : #'as yet unclassified' }
EmpresaSolicitante class >> crear: solicitudes resueltas: solicitudesResueltas invalidas: solicitudesInvalidas nombre: unNombre rubro: unRubro producto: unProducto puntual: esPuntual rango: unRango direccion: unaDireccion contacto: unContacto [

	| empresa |
	empresa := self new.
	empresa
		inicializar: solicitudes
		resueltas: solicitudesResueltas
		invalidas: solicitudesInvalidas
		nombre: unNombre rubro: unRubro producto: unProducto puntual: esPuntual rango: unRango direccion: unaDireccion contacto: unContacto.
	^ empresa
]

{ #category : #Aplicacion }
EmpresaSolicitante >> actualizarSolicitudesResueltas [

colSolicitudes do: [ :unaSolicitud |  (unaSolicitud getPendiente) ifFalse: [colSolicitudesResueltas add: unaSolicitud]].

colSolicitudes removeAllFoundIn: colSolicitudesResueltas .

self changed
]

{ #category : #'as yet unclassified' }
EmpresaSolicitante >> agregarSolicitud: unaSolicitud [

	colSolicitudes add: unaSolicitud.
	self changed.
	
]

{ #category : #'as yet unclassified' }
EmpresaSolicitante >> buscarSolicitud: numeroIdentificatorio [

	^ colSolicitudes
		  detect: [ :solicitud | solicitud esIgual: numeroIdentificatorio ]
		  ifNone: [ 
			  colSolicitudesResueltas
				  detect: [ :solicitud | solicitud esIgual: numeroIdentificatorio ]
				  ifNone: [ 
					  colSolicitudesInvalidas
						  detect: [ :solicitud | 
						  solicitud esIgual: numeroIdentificatorio ]
						  ifNone: [ nil ] ] ]
]

{ #category : #Aplicacion }
EmpresaSolicitante >> getCantSolicitudesResueltas [
^ colSolicitudesResueltas size.
]

{ #category : #Getters }
EmpresaSolicitante >> getColSolicitudes [

	^ colSolicitudes
]

{ #category : #'as yet unclassified' }
EmpresaSolicitante >> getColSolicitudesIDString [
	
	|aTexto|
	aTexto := String new.
	colSolicitudes do: [ :solicitud |  aTexto := aTexto , solicitud getNumeroIdentificatorio asString , ', '].
	^aTexto.
]

{ #category : #Getters }
EmpresaSolicitante >> getColSolicitudesInvalidas [

	^ colSolicitudesInvalidas
]

{ #category : #'as yet unclassified' }
EmpresaSolicitante >> getColSolicitudesInvalidasIDString [
	
	|aTexto|
	aTexto := String new.
	colSolicitudesInvalidas do: [ :solicitud |  aTexto := aTexto , solicitud getNumeroIdentificatorio asString , ', '].
	^aTexto.
]

{ #category : #Getters }
EmpresaSolicitante >> getColSolicitudesResueltas [

	^ colSolicitudesResueltas
]

{ #category : #'as yet unclassified' }
EmpresaSolicitante >> getColSolicitudesResueltasIDString [
	
	|aTexto|
	aTexto := String new.
	colSolicitudesResueltas do: [ :solicitud |  aTexto := aTexto , solicitud getNumeroIdentificatorio asString , ', '].
	^aTexto.
]

{ #category : #Aplicacion }
EmpresaSolicitante >> getSolicitudesPendientes [

	| colSolicitudesPendientes |
	colSolicitudesPendientes := OrderedCollection new.
	colSolicitudesPendientes := colSolicitudes select: [ :solicitud | 
		                            solicitud getPendiente ].
	^ colSolicitudesPendientes 
]

{ #category : #Aplicacion }
EmpresaSolicitante >> getSolicitudesPendientesFecha: fecha [

|colSolicitudesFecha|
colSolicitudesFecha := OrderedCollection new.

colSolicitudes do: [ :unaSolicitud | (unaSolicitud getPendiente) ifTrue: [ (unaSolicitud esFecha: fecha) ifTrue: [ colSolicitudesFecha add: unaSolicitud  ] ] ].

^colSolicitudesFecha.
]

{ #category : #Aplicacion }
EmpresaSolicitante >> haceFraude: numeroIdentificatorio [
^ colSolicitudes anySatisfy: [ :solicitud | solicitud esIgual: numeroIdentificatorio ]
]

{ #category : #'as yet unclassified' }
EmpresaSolicitante >> inicializar: solicitudes resueltas: solicitudesResueltas invalidas: solicitudesInvalidas nombre: unNombre rubro: unRubro producto: unProducto puntual: esPuntual rango: unRango direccion: unaDireccion contacto: unContacto [

	colSolicitudes := solicitudes.
	colSolicitudesResueltas := solicitudesResueltas.
	colSolicitudesInvalidas := solicitudesInvalidas.
	self
		inicializar: unNombre
		rubro: unRubro
		producto: unProducto
		puntual: esPuntual
		rango: unRango
		direccion: unaDireccion
		contacto: unContacto
]

{ #category : #Aplicacion }
EmpresaSolicitante >> invalidarSolicitudesVencidas [

	colSolicitudes do: [ :unaSolicitud | 
		unaSolicitud chequearValidez ifFalse: [ 
			colSolicitudesInvalidas add: unaSolicitud ] ].
	
	colSolicitudes removeAllFoundIn: colSolicitudesInvalidas.
	
	self changed.

]

{ #category : #Aplicacion }
EmpresaSolicitante >> invalidarSolicitudesVencidasFechaActual: fechaActual [

	colSolicitudes do: [ :unaSolicitud | 
		(unaSolicitud chequearValidezFechaActual: fechaActual) ifFalse: [ 
			colSolicitudesInvalidas add: unaSolicitud ] ].
	
	colSolicitudes removeAllFoundIn: colSolicitudesInvalidas.
	
	self changed.

]

{ #category : #Aplicacion }
EmpresaSolicitante >> revalidarSolicitud: unaSolicitud tiempo: tiempo [

	unaSolicitud setTiempoValidez: unaSolicitud getTiempoValidez + tiempo.
	colSolicitudesInvalidas remove: unaSolicitud.
	colSolicitudes add: unaSolicitud.
	self changed.
]

{ #category : #Setters }
EmpresaSolicitante >> setColSolicitudes: anObject [

	colSolicitudes := anObject
]

{ #category : #Setters }
EmpresaSolicitante >> setColSolicitudesInvalidas: anObject [

	colSolicitudesInvalidas := anObject
]

{ #category : #Setters }
EmpresaSolicitante >> setColSolicitudesResueltas: anObject [

	colSolicitudesResueltas := anObject
]

{ #category : #'as yet unclassified' }
EmpresaSolicitante >> tieneSolicitud: unaSolicitud [

	| colTodasLasSolicitudes|
	colTodasLasSolicitudes := (colSolicitudes union: (colSolicitudesResueltas union: colSolicitudesInvalidas)) .
	^ colTodasLasSolicitudes anySatisfy: [ :solicitud |  solicitud esIgual: unaSolicitud getNumeroIdentificatorio ].
]

{ #category : #'as yet unclassified' }
EmpresaSolicitante >> tieneSolicitudInvalida: unaSolicitud [

	^ colSolicitudesInvalidas anySatisfy: [ :solicitud | unaSolicitud = solicitud ].
]
