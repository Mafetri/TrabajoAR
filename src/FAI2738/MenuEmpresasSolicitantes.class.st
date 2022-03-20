Class {
	#name : #MenuEmpresasSolicitantes,
	#superclass : #MenuVisual,
	#instVars : [
		'bRegistrarEmpresaSoloSolicitante',
		'bBuscarSolicitud',
		'bRevalidar',
		'bSolicitudesPendientes',
		'bSolicitudesPendientesFecha',
		'bSolicitudesResueltas',
		'bEmpresasOrdenadas',
		'tablaSolicitudesPendientes',
		'tablaSolicitudesPendientesFecha',
		'tablaEmpresasSolicitantes',
		'tablaSolicitudesResueltas',
		'tablaEmpresasOrdenadas',
		'topTablaEmpresas',
		'nombreTitulo',
		'pendientesTitulo',
		'resueltasTitulo',
		'invalidasTitulo',
		'deTrabajoTitulo',
		'deServicioTitulo'
	],
	#category : #FAI2738
}

{ #category : #'as yet unclassified' }
MenuEmpresasSolicitantes >> convertirSolicitantesVisuales: colEmpresasSolicitantes [

	|colSolicitantesVisuales|
	colSolicitantesVisuales := OrderedCollection new.
	colEmpresasSolicitantes do: [ :empresa | colSolicitantesVisuales add: (EmpresaSolicitanteVisual crear: empresa) ].
	^ colSolicitantesVisuales.
]

{ #category : #'as yet unclassified' }
MenuEmpresasSolicitantes >> convertirSolicitudesVisuales: colSolicitudes [

	| colSolicitudesVisuales |
	colSolicitudesVisuales := OrderedCollection new.
	colSolicitudes do: [ :solicitud | 
		colSolicitudesVisuales add: ((solicitud class = DeServicio)
				 ifTrue: [ DeServicioVisual new inicializar: solicitud ]
				 ifFalse: [ DeTrabajoVisual new inicializar: solicitud ]) ].
	^ colSolicitudesVisuales
]

{ #category : #'as yet unclassified' }
MenuEmpresasSolicitantes >> inicializar: gestorEmpleos [

	| inputBusqueda solicitudBuscada inputTiempo empresa fecha colSolicitudesFecha |
	"===========================  Ventana inicial  ==========================="
	self inicializar: gestorEmpleos tamanio: 1000 @ 700.
	tituloVentana contents: 'Empresas Solicitantes'.

	"===========================  Tabla Empresas Solicitantes  ==========================="
	tablaEmpresasSolicitantes := FTTableMorph new.
	tablaEmpresasSolicitantes dataSource:
		(FTSimpleDataSource elements: (self convertirSolicitantesVisuales:
				  gestorEmpleos getColEmpresasSolicitantes)).
	tablaEmpresasSolicitantes color: Color darkGray.
	self addMorph: tablaEmpresasSolicitantes.
	tablaEmpresasSolicitantes position: origen + (100 @ 90).
	tablaEmpresasSolicitantes extent: 800 @ 400.

	topTablaEmpresas := BorderedMorph new.
	topTablaEmpresas color: Color blue.
	topTablaEmpresas extent: 800 @ 20.
	topTablaEmpresas position:
		tablaEmpresasSolicitantes position + (0 @ -20).
	self addMorph: topTablaEmpresas.

	nombreTitulo := TextMorph new.
	nombreTitulo contents: 'Nombre'.
	nombreTitulo position: topTablaEmpresas position.
	self addMorphFront: nombreTitulo.

	pendientesTitulo := TextMorph new.
	pendientesTitulo contents: 'Pendientes'.
	pendientesTitulo position: nombreTitulo position + (120 @ 0).
	self addMorphFront: pendientesTitulo.

	resueltasTitulo := TextMorph new.
	resueltasTitulo contents: 'Resueltas'.
	resueltasTitulo position: pendientesTitulo position + (120 @ 0).
	self addMorphFront: resueltasTitulo.

	invalidasTitulo := TextMorph new.
	invalidasTitulo contents: 'Invalidas'.
	invalidasTitulo position: resueltasTitulo position + (120 @ 0).
	self addMorphFront: invalidasTitulo.

	deTrabajoTitulo := TextMorph new.
	deTrabajoTitulo contents: 'Trabajo'.
	deTrabajoTitulo position: invalidasTitulo position + (190 @ 0).
	self addMorphFront: deTrabajoTitulo.

	deServicioTitulo := TextMorph new.
	deServicioTitulo contents: 'Servicio'.
	deServicioTitulo position: deTrabajoTitulo position + (120 @ 0).
	self addMorphFront: deServicioTitulo.

	"============================  Buscador  de Solicitud  ==========================="
	bBuscarSolicitud := BotonAccion new.
	bBuscarSolicitud label: 'Buscar Solicitud'.
	bBuscarSolicitud mouseAction: [ 
		inputBusqueda := UIManager default request:
			                 'Ingresar numero identificatorio'.
		inputBusqueda ifNotNil: [ 
			solicitudBuscada := gestorEmpleos buscarSolicitud:
				                    inputBusqueda asInteger.
			solicitudBuscada
				ifNotNil: [ 
					solicitudBuscada class == DeServicio
						ifTrue: [ 
							(DeServicioVisualEmpresa new inicializarVertical: solicitudBuscada empresa: (gestorEmpleos buscarEmpresaSolicitud: solicitudBuscada)) 
								openInWindowLabeled: 'Solicitud de Servicio' ]
						ifFalse: [ 
							(DeTrabajoVisualEmpresa new inicializarVertical: solicitudBuscada empresa: (gestorEmpleos buscarEmpresaSolicitud: solicitudBuscada)) 
								openInWindowLabeled: 'Solicitud de Trabajo' ] ]
				ifNil: [ 
				UIManager default alert: 'No se ha encontrado dicha solicitud.' ] ] ].
	bBuscarSolicitud position:
		tablaEmpresasSolicitantes position + (0 @ 420).
	bBuscarSolicitud extent: 180 @ 60.
	bBuscarSolicitud borderStyle: estiloBorde.
	self addMorph: bBuscarSolicitud.

	"============================  Revalidar Solicitud  ==========================="
	bRevalidar := BotonAccion new.
	bRevalidar label: 'Revalidar Solicitud'.
	bRevalidar mouseAction: [ 
		inputBusqueda := UIManager default request:
			                 'Ingresar numero identificatorio'.
		inputBusqueda ifNotNil: [ 
			solicitudBuscada := gestorEmpleos buscarSolicitud:
				                    inputBusqueda asInteger.
			solicitudBuscada
				ifNotNil: [ 
					empresa := gestorEmpleos buscarEmpresaSolicitudInvalida: solicitudBuscada.
					empresa
						ifNotNil: [ 
							inputTiempo := UIManager default request:
								               'Ingresar tiempo de validez en dias'.
							empresa
								revalidarSolicitud: solicitudBuscada
								tiempo: inputTiempo asInteger ]
						ifNil: [ 
							UIManager default alert:
								'No hay empresa con dicha solicitud vencida.' ] ]
				ifNil: [ UIManager default alert: 'No existe dicha solicitud' ] ] ].
	bRevalidar extent: 180 @ 60.
	bRevalidar position: bBuscarSolicitud position + (190 @ 0).
	bRevalidar borderStyle: estiloBorde.
	self addMorph: bRevalidar.

	"============================  Registrar Empresa como solo Solicitante  ==========================="
	bRegistrarEmpresaSoloSolicitante := BotonAccion new.
	bRegistrarEmpresaSoloSolicitante position:
		bRevalidar position + (190 @ 0).
	bRegistrarEmpresaSoloSolicitante label:
		'Registrar Empresa Solicitante'.
	bRegistrarEmpresaSoloSolicitante mouseAction: [ 
		self registrarEmpresaSoloSolicitante: gestorEmpleos ].
	bRegistrarEmpresaSoloSolicitante extent: 200 @ 60.
	bRegistrarEmpresaSoloSolicitante borderStyle: estiloBorde.
	self addMorph: bRegistrarEmpresaSoloSolicitante.

	"============================  LISTADOS  ==========================="
	"----  Solicitudes Pendientes de una Empresa dada  ----"
	tablaSolicitudesPendientes := FTTableMorph new.
	tablaSolicitudesPendientes extent: 700 @ 250.
	bSolicitudesPendientes := BotonAccion new.
	bSolicitudesPendientes label: 'Sol Pendientes Empresa'.
	bSolicitudesPendientes position:
		bRegistrarEmpresaSoloSolicitante position + (210 @ 0).
	bSolicitudesPendientes extent: 200 @ 60.
	bSolicitudesPendientes mouseAction: [ 
		empresa := gestorEmpleos buscarEmpresa:
			           (UIManager default request:
				            'Ingrese nombre de la empresa').
		empresa
			ifNotNil: [ 
				tablaSolicitudesPendientes dataSource:
					(FTSimpleDataSource elements:
						 (self convertirSolicitudesVisuales:
							  empresa getSolicitudesPendientes)).
				tablaSolicitudesPendientes openInWindow ]
			ifNil: [ UIManager default alert: 'No hay solicitudes pendientes' ] ].
	bSolicitudesPendientes borderStyle: estiloBorde.
	self addMorph: bSolicitudesPendientes.

	"----  Solicitudes Pendientes de una Fecha dada  ----"
	tablaSolicitudesPendientesFecha := FTTableMorph new.
	tablaSolicitudesPendientesFecha extent: 700 @ 250.
	bSolicitudesPendientesFecha := BotonAccion new.
	bSolicitudesPendientesFecha label: 'Sol Pendientes Fecha'.
	bSolicitudesPendientesFecha position:
		bBuscarSolicitud position + (0 @ 80).
	bSolicitudesPendientesFecha extent: 200 @ 60.
	bSolicitudesPendientesFecha borderStyle: estiloBorde.
	self addMorph: bSolicitudesPendientesFecha.
	bSolicitudesPendientesFecha mouseAction: [ 
		fecha := UIManager default request: 'Ingrese fecha: (MM/DD/YYYY)'.
		fecha ifNotEmpty: [ 
			fecha := fecha asDate.
			colSolicitudesFecha := gestorEmpleos 
				                       solicitudesPendientesPorFecha: fecha.
			colSolicitudesFecha
				ifNotEmpty: [ 
					tablaSolicitudesPendientesFecha dataSource:
						(FTSimpleDataSource elements:
							 (self convertirSolicitudesVisuales: colSolicitudesFecha)).
					tablaSolicitudesPendientesFecha openInWindow ]
				ifEmpty: [ 
				UIManager default alert: 'No hay solicitudes pendientes' ] ] ].

	"----  Solicitudes Resueltas  ----"
	bSolicitudesResueltas := BotonAccion new.
	bSolicitudesResueltas label: 'Solicitudes Resueltas'.
	bSolicitudesResueltas position:
		bSolicitudesPendientesFecha position + (210 @ 0).
	bSolicitudesResueltas extent: 200 @ 60.
	bSolicitudesResueltas borderStyle: estiloBorde.
	tablaSolicitudesResueltas := FTTableMorph new.
	tablaSolicitudesResueltas extent: 700 @ 250.
	bSolicitudesResueltas mouseAction: [ 
		tablaSolicitudesResueltas dataSource:
			(FTSimpleDataSource elements: (self convertirSolicitudesVisuales:
					  gestorEmpleos getSolicitudesResueltas)).
		tablaSolicitudesResueltas openInWindow ].
	self addMorph: bSolicitudesResueltas.

	"----  Empresas ordenadas por Solicitudes Resueltas  ----"
	bEmpresasOrdenadas := BotonAccion new.
	bEmpresasOrdenadas label: 'Empresas Ordenadas'.
	bEmpresasOrdenadas position:
		bSolicitudesResueltas position + (210 @ 0).
	bEmpresasOrdenadas extent: 200 @ 60.
	bEmpresasOrdenadas borderStyle: estiloBorde.
	tablaEmpresasOrdenadas := FTTableMorph new.
	tablaEmpresasOrdenadas extent: 800 @ 250.
	bEmpresasOrdenadas mouseAction: [ 
		tablaEmpresasOrdenadas dataSource:
			(FTSimpleDataSource elements: (self convertirSolicitantesVisuales:
					  gestorEmpleos getEmpresasSolicitantesOrdenadas)).
		tablaEmpresasOrdenadas openInWindow ].
	self addMorph: bEmpresasOrdenadas
]

{ #category : #'as yet unclassified' }
MenuEmpresasSolicitantes >> registrarEmpresaSoloSolicitante: gestorEmpleos [

	| input colDatos empresa |
	"---- Ingreso datos ----"
	input := UIManager default request:
		         'Ingresar datos separados por puntocoma (ej: Cadi;Herrajes;Picaporte;S;2;Las Heras 95;2995806355)'.
	input ifNotNil: [ 
		colDatos := input splitOn: ';'.
		empresa := (EmpresaSolicitante
				 crear: OrderedCollection new
				 resueltas: OrderedCollection new
				 invalidas: OrderedCollection new
				 nombre: (colDatos at: 1)
				 rubro: (colDatos at: 2)
				 producto: (((colDatos at: 3) = '-')
			          	ifTrue: [ nil ]
			            ifFalse: [ colDatos at: 3 ])
				 puntual: (colDatos at: 4) = 'S'
				 rango: (colDatos at: 5) asInteger
				 direccion: (colDatos at: 6)
				 contacto: (colDatos at: 7)).
		gestorEmpleos agregarSoliciante: empresa.
		]
]

{ #category : #updating }
MenuEmpresasSolicitantes >> update: gestorEmpleos [

	gestorEmpleos ifNotNil: [ 
		gestorEmpleos getColEmpresasSolicitantes ifNotNil: [ 
			tablaEmpresasSolicitantes dataSource:
				(FTSimpleDataSource elements:
					 (self convertirSolicitantesVisuales:
						  gestorEmpleos getColEmpresasSolicitantes)) ] ]
]
