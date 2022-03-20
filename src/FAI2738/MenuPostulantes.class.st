Class {
	#name : #MenuPostulantes,
	#superclass : #MenuVisual,
	#instVars : [
		'bRegistrar',
		'bRegistrarPersona',
		'bRegistrarEmpresa',
		'bRegistrarEmpresaSolicitante',
		'tablaPersonas',
		'tablaEmpresas',
		'topTablaPersonas',
		'topTablaEmpresas',
		'nombreTituloPersona',
		'aptitudesTituloPersona',
		'direccionTituloPersona',
		'contactoTituloPersona',
		'nombreTituloEmpresa',
		'rubroTituloEmpresa',
		'productoTituloEmpresa',
		'rangoTituloEmpresa',
		'puntualidadTituloEmpresa',
		'direccionTituloEmpresa',
		'contactoTituloEmpresa'
	],
	#category : #FAI2738
}

{ #category : #'as yet unclassified' }
MenuPostulantes >> convertirPostulantesVisuales: colPostulantes [
	|colPostulantesVisuales |
	colPostulantesVisuales := OrderedCollection new.
	"Por cada postulante, creo un postulante visual dependiente del mismo postulante el cual se agrega a la col de postulantes"
	colPostulantes do: [ :p | colPostulantesVisuales add: (p class == Persona ifTrue: [PersonaVisual crear: p] ifFalse: [EmpresaVisual crear: p])].
	^colPostulantesVisuales.
]

{ #category : #'as yet unclassified' }
MenuPostulantes >> inicializar: gestorEmpleos [

	"===========================  Ventana inicial  ==========================="
	self inicializar: gestorEmpleos tamanio: (1250@700).
	tituloVentana contents: 'Postulantes'.
	
	"===========================  Tablas de Postulantes  ==========================="
	"-------  Personas -------"
	tablaPersonas := FTTableMorph new.
	tablaPersonas dataSource: (FTSimpleDataSource elements: (self convertirPostulantesVisuales: gestorEmpleos getColPostulantesPersonas)).
	tablaPersonas color: Color darkGray.
	self addMorph: tablaPersonas.
	tablaPersonas position: (origen + (80@90)).
	tablaPersonas extent: 850@260.
	tablaPersonas borderStyle: estiloBorde.
	
	topTablaPersonas := BorderedMorph new.
	topTablaPersonas color: Color blue.
	topTablaPersonas position: tablaPersonas position + (0@(-20)).
	topTablaPersonas extent: 850@20.
	self addMorph: topTablaPersonas.
	
	nombreTituloPersona := TextMorph new. 
	nombreTituloPersona contents: 'Nombre Completo'.
	nombreTituloPersona position: topTablaPersonas position.
	self addMorphFront: nombreTituloPersona.
	
	aptitudesTituloPersona := TextMorph new. 
	aptitudesTituloPersona contents: 'Aptitudes'.
	aptitudesTituloPersona position: nombreTituloPersona position + (150@0).
	self addMorphFront: aptitudesTituloPersona.
	
	direccionTituloPersona := TextMorph new. 
	direccionTituloPersona contents: 'Direccion'.
	direccionTituloPersona position: aptitudesTituloPersona position + (350@0).
	self addMorphFront: direccionTituloPersona.
	
	contactoTituloPersona := TextMorph new.
	contactoTituloPersona contents: 'Contacto'.
	contactoTituloPersona position: direccionTituloPersona position + (150@0).
	self addMorphFront: contactoTituloPersona.
	
	"-------  Empresas -------"
	tablaEmpresas := FTTableMorph new.
	tablaEmpresas dataSource: (FTSimpleDataSource elements: (self convertirPostulantesVisuales: gestorEmpleos getColPostulantesEmpresas)).
	tablaEmpresas color: Color darkGray.
	self addMorph: tablaEmpresas.
	tablaEmpresas position: (tablaPersonas position + (0@290)).
	tablaEmpresas extent: 850@260.
	tablaEmpresas borderStyle: estiloBorde.
	
	topTablaEmpresas := BorderedMorph new.
	topTablaEmpresas color: Color blue.
	topTablaEmpresas position: tablaEmpresas position + (0@(-20)).
	topTablaEmpresas extent: 850@20.
	self addMorph: topTablaEmpresas.
	
	nombreTituloEmpresa := TextMorph new. 
	nombreTituloEmpresa contents: 'Nombre'.
	nombreTituloEmpresa position: topTablaEmpresas position.
	self addMorphFront: nombreTituloEmpresa.
	
	rubroTituloEmpresa := TextMorph new. 
	rubroTituloEmpresa contents: 'Rubro'.
	rubroTituloEmpresa position: nombreTituloEmpresa position + (150@0).
	self addMorphFront: rubroTituloEmpresa.
	
	productoTituloEmpresa := TextMorph new. 
	productoTituloEmpresa contents: 'Producto'.
	productoTituloEmpresa position: rubroTituloEmpresa position + (150@0).
	self addMorphFront: productoTituloEmpresa.
	
	puntualidadTituloEmpresa := TextMorph new. 
	puntualidadTituloEmpresa contents: 'Puntual?'.
	puntualidadTituloEmpresa position: productoTituloEmpresa position + (150@0).
	self addMorphFront: puntualidadTituloEmpresa.
	
	rangoTituloEmpresa := TextMorph new. 
	rangoTituloEmpresa contents: 'Rango'.
	rangoTituloEmpresa position: puntualidadTituloEmpresa position + (60@0).
	self addMorphFront: rangoTituloEmpresa.
	
	direccionTituloEmpresa := TextMorph new. 
	direccionTituloEmpresa contents: 'Direccion'.
	direccionTituloEmpresa position: rangoTituloEmpresa position + (60@0).
	self addMorphFront: direccionTituloEmpresa.
	
	contactoTituloEmpresa := TextMorph new. 
	contactoTituloEmpresa contents: 'Direccion'.
	contactoTituloEmpresa position: direccionTituloEmpresa position + (150@0).
	self addMorphFront: contactoTituloEmpresa.
	
	"===========================  Botones Registro  ==========================="
	" ----  Persona  ---- "
	bRegistrarPersona := BotonAccion new.
	bRegistrarPersona label: 'Registrar Persona'.
	bRegistrarPersona position: tablaPersonas position + (890@70).
	bRegistrarPersona mouseAction: [ self registrarPersona: gestorEmpleos].
	bRegistrarPersona extent: (200@60).
	bRegistrarPersona borderStyle: estiloBorde.
	self addMorph: bRegistrarPersona.
	
	" ----  Empresa  ---- "
	bRegistrarEmpresa := BotonAccion new.
	bRegistrarEmpresa label: 'Registrar Empresa'.
	bRegistrarEmpresa position: tablaEmpresas position + (890@15).
	bRegistrarEmpresa mouseAction: [ self registrarEmpresa: gestorEmpleos ].
	bRegistrarEmpresa extent: (200@60).
	bRegistrarEmpresa borderStyle: estiloBorde.
	self addMorph: bRegistrarEmpresa.
	
	" ----  Empresa Solicitante  ---- "
	bRegistrarEmpresaSolicitante := BotonAccion new.
	bRegistrarEmpresaSolicitante label: 'Registrar Empresa Solicitante'.
	bRegistrarEmpresaSolicitante position: bRegistrarEmpresa position + (0@95).
	bRegistrarEmpresaSolicitante mouseAction: [ self registrarEmpresaSolicitante: gestorEmpleos ].
	bRegistrarEmpresaSolicitante extent: (200@60).
	bRegistrarEmpresaSolicitante borderStyle: estiloBorde.
	self addMorph: bRegistrarEmpresaSolicitante
]

{ #category : #accessing }
MenuPostulantes >> registrarEmpresa: gestorEmpleos [

	| input colDatos |
	"---- Ingreso datos ----"
	input := UIManager default request:
		         'Ingresar datos separados por puntocoma (ej: Nombre;Rubro;Producto/-;Puntual (S/N);Rango;Direccion;Telefono)'.
	input ifNotNil: [ 
		colDatos := input splitOn: ';'.
		gestorEmpleos agregarPostulante: (Empresa
				 crear: (colDatos at: 1)
				 rubro: (colDatos at: 2)
				 producto: (((colDatos at: 3) = '-')
						  ifTrue: [ nil ]
						  ifFalse: [ colDatos at: 3 ])
				 puntual: (colDatos at: 4) = 'S'
				 rango: (colDatos at: 5) asInteger
				 direccion: (colDatos at: 6)
				 contacto: (colDatos at: 7)) ]
]

{ #category : #'as yet unclassified' }
MenuPostulantes >> registrarEmpresaSolicitante: gestorEmpleos [

	| input colDatos empresa |
	"---- Ingreso datos ----"
	input := UIManager default request:
		         'Ingresar datos separados por puntocoma (ej: Nombre;Rubro;Producto/-;Puntual(S/N);Rango;Direccion;Telefono)'.
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
		gestorEmpleos agregarPostulante: empresa.
		gestorEmpleos agregarSoliciante: empresa.
		]
]

{ #category : #'as yet unclassified' }
MenuPostulantes >> registrarPersona: gestorEmpleos [
	
	| input colDatos |

	"---- Ingreso datos ----"
	input := UIManager default request: 'Ingresar datos separadas por puntocoma y aptitudes por comas (ej: Nombre;Aptitud1,AptitudN;Direccion;Telefono)'.
	input ifNotNil: [ 
		colDatos := (input splitOn: ';').
		gestorEmpleos agregarPostulante: (Persona crear: (colDatos at: 1) aptitudes: ((colDatos at: 2) splitOn: ',') direccion: (colDatos at: 3) contacto: (colDatos at: 4)). 
		]
	
]

{ #category : #updating }
MenuPostulantes >> update: gestorEmpleos [

	gestorEmpleos ifNotNil: [ 
		gestorEmpleos getColPostulantes ifNotNil: [ 
			tablaPersonas dataSource:
				(FTSimpleDataSource elements: (self convertirPostulantesVisuales:
						  gestorEmpleos getColPostulantesPersonas)) ].
		gestorEmpleos getColPostulantes ifNotNil: [ 
			tablaEmpresas dataSource:
				(FTSimpleDataSource elements: (self convertirPostulantesVisuales:
						  gestorEmpleos getColPostulantesEmpresas)) ] ]
]
