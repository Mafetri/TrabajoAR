Class {
	#name : #GestorEmpleos,
	#superclass : #Object,
	#instVars : [
		'colPropuestas',
		'colPostulantes',
		'colEmpresasSolicitantes'
	],
	#category : #FAI2738
}

{ #category : #'as yet unclassified' }
GestorEmpleos class >> crear: propuestas postulantes: postulantes empresasSolicitantes: empresasSolicitantes [
	|gestor|
	gestor := self new.
	gestor inicializar: propuestas postulantes: postulantes empresasSolicitantes: empresasSolicitantes.
	^gestor.
]

{ #category : #Aplicacion }
GestorEmpleos >> aceptarPropuesta: unaPropuesta [

	|solicitud|
	solicitud := unaPropuesta aceptar.

	colPropuestas removeAll: (colPropuestas select: [ :propuesta | (solicitud esIgual: propuesta getSolicitud getNumeroIdentificatorio)]).

	self changed.

]

{ #category : #'as yet unclassified' }
GestorEmpleos >> agregarPostulante: postulante [

	colPostulantes add: postulante.
	self changed.
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> agregarSoliciante: empresa [
	colEmpresasSolicitantes add: empresa.
	self changed.
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> agregarSolicitud: solicitud empresa: empresa [
	
	empresa agregarSolicitud: solicitud.
	self changed.
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> buscarEmpresa: nombre [

	^ colEmpresasSolicitantes detect: [ :empresa | empresa getNombre = nombre ] ifNone: [ nil ].
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> buscarEmpresaSolicitud: unaSolicitud [

	^ colEmpresasSolicitantes detect: [ :empresa | empresa tieneSolicitud: unaSolicitud ] ifNone: [ nil ].
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> buscarEmpresaSolicitudInvalida: unaSolicitud [.

	^ colEmpresasSolicitantes detect: [ :empresa | empresa tieneSolicitudInvalida: unaSolicitud ] ifNone: [ nil ].
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> buscarSolicitud: numeroIdentificatorio [
	
	|solicitud|
	colEmpresasSolicitantes do: [ :empresa | solicitud ifNil: [ solicitud := empresa buscarSolicitud: numeroIdentificatorio ] ].
	^solicitud.
]

{ #category : #Aplicacion }
GestorEmpleos >> generarPropuestas [

	| colSolicitudesPendientes unaPropuesta |
	colSolicitudesPendientes := OrderedCollection new.

	"Para acada empresa, agrego sus solicitudes pendientes a la coleccion"
	colEmpresasSolicitantes do: [ :empresa | colSolicitudesPendientes := colSolicitudesPendientes union: empresa getSolicitudesPendientes. ].
	
	"Ordeno la coleccion por fecha de solicitud"
	colSolicitudesPendientes asSortedCollection: [ :solicitud1 :solicitud2 | 
		solicitud1 getFecha > solicitud2 getFecha ].

	"Agrego nuevas propuestas"
	colSolicitudesPendientes do: [ :solicitud | 
		(solicitud quienSatisface: colPostulantes) do: [ :postulante | 
			unaPropuesta := Propuesta crear: postulante solicitud: solicitud.
			"Si la nueva propuesta no esta en la coleccion de propuestas, entonces la agrego, sino se descarta"
			(colPropuestas anySatisfy: [ :propuesta | 
				 propuesta esIgual: unaPropuesta ]) ifFalse: [ 
				colPropuestas add: unaPropuesta ] ] ].

	self changed.
]

{ #category : #Getters }
GestorEmpleos >> getColEmpresasSolicitantes [

	^ colEmpresasSolicitantes
]

{ #category : #Getters }
GestorEmpleos >> getColPostulantes [

	^colPostulantes.
]

{ #category : #Getters }
GestorEmpleos >> getColPostulantesEmpresas [

	^ colPostulantes select: [ :empresa | empresa class == Empresa or: empresa class == EmpresaSolicitante].
]

{ #category : #Getters }
GestorEmpleos >> getColPostulantesPersonas [

	^ colPostulantes select: [ :persona | persona class == Persona ].
]

{ #category : #Getters }
GestorEmpleos >> getColPropuestas [

	^ colPropuestas
]

{ #category : #Aplicacion }
GestorEmpleos >> getEmpresasSolicitantesOrdenadas [
|colEmpresasOrdenadas|
colEmpresasOrdenadas := OrderedCollection new.

colEmpresasOrdenadas := colEmpresasSolicitantes asSortedCollection: [ :x :y | x getCantSolicitudesResueltas > y getCantSolicitudesResueltas ].

^ colEmpresasOrdenadas 
]

{ #category : #Aplicacion }
GestorEmpleos >> getPropuestasFraudulentas [

	^ colPropuestas select: [ :propuesta | propuesta esFraudulenta ].
]

{ #category : #Aplicacion }
GestorEmpleos >> getSolicitudesPendientes: empresa [
^ empresa getSolicitudesPendientes .
]

{ #category : #Aplicacion }
GestorEmpleos >> getSolicitudesResueltas [

	|colSolicitudes|
	colSolicitudes := OrderedCollection new.
	colEmpresasSolicitantes do: [ :empresa | colSolicitudes := colSolicitudes union: empresa getColSolicitudesResueltas ].
	^colSolicitudes
]

{ #category : #'as yet unclassified' }
GestorEmpleos >> inicializar: propuestas postulantes: postulantes empresasSolicitantes: empresasSolicitantes [
	colPropuestas := propuestas.
	colPostulantes := postulantes.
	colEmpresasSolicitantes := empresasSolicitantes.
]

{ #category : #Aplicacion }
GestorEmpleos >> iniciarDia [

colEmpresasSolicitantes do: [ :empresa | empresa invalidarSolicitudesVencidas. empresa actualizarSolicitudesResueltas ].
]

{ #category : #Aplicacion }
GestorEmpleos >> iniciarDiaFechaActual: fechaActual [

colEmpresasSolicitantes do: [ :empresa | empresa invalidarSolicitudesVencidasFechaActual: fechaActual. empresa actualizarSolicitudesResueltas ].
]

{ #category : #Setters }
GestorEmpleos >> setColEmpresasSolicitantes: anObject [

	colEmpresasSolicitantes := anObject
]

{ #category : #Setters }
GestorEmpleos >> setColPostulantes: anObject [

	colPostulantes := anObject
]

{ #category : #Setters }
GestorEmpleos >> setColPropuestas: anObject [

	colPropuestas := anObject
]

{ #category : #Aplicacion }
GestorEmpleos >> solicitudesPendientesPorFecha: fecha [

	| colSolicitudesPendientesFecha |
	colSolicitudesPendientesFecha := OrderedCollection new.

	colEmpresasSolicitantes do: [ :empresa | 
		colSolicitudesPendientesFecha := colSolicitudesPendientesFecha union:
			(empresa getSolicitudesPendientesFecha: fecha) ].
	
	^ colSolicitudesPendientesFecha
]
