Class {
	#name : #MenuPropuestas,
	#superclass : #MenuVisual,
	#instVars : [
		'tablaPropuestas',
		'bGenerarPropuestas',
		'bFraude',
		'bControlFraude',
		'topTabla',
		'postulanteTitulo',
		'solicitudTitulo'
	],
	#category : #FAI2738
}

{ #category : #'as yet unclassified' }
MenuPropuestas >> convertirPropuestasVisuales: colPropuestas gestor: gestorEmpleos [

	|colPropuestasVisuales|
	colPropuestasVisuales := OrderedCollection new.
	colPropuestas do: [ :propuesta | colPropuestasVisuales add: (PropuestaVisual crear: propuesta gestor: gestorEmpleos) ].
	^ colPropuestasVisuales.
]

{ #category : #'as yet unclassified' }
MenuPropuestas >> inicializar: gestorEmpleos [

	| fraudulentas tablaFraudulentas |
	"===========================  Ventana inicial  ==========================="
	self inicializar: gestorEmpleos tamanio: 1000 @ 700.
	gestorEmpleos addDependent: self.
	tituloVentana contents: 'Propuestas'.

	"===========================  Tabla Propuestas  ==========================="
	tablaPropuestas := FTTableMorph new.
	tablaPropuestas dataSource: (FTSimpleDataSource elements:
			 (self convertirPropuestasVisuales: gestorEmpleos getColPropuestas gestor: gestorEmpleos)).
	tablaPropuestas color: Color darkGray.
	self addMorph: tablaPropuestas.
	tablaPropuestas position: origen + (80 @ 90).
	tablaPropuestas extent: 550 @ 550.

	topTabla := BorderedMorph new.
	topTabla initialize.
	topTabla color: Color blue.
	topTabla extent: 550@20.
	topTabla position: tablaPropuestas position + (0@(-20)).
	self addMorph: topTabla.
	
	postulanteTitulo := TextMorph new.
	postulanteTitulo contents: 'Postulante'.
	postulanteTitulo position: topTabla position + (5@0).
	self addMorphFront: postulanteTitulo.
	
	solicitudTitulo := TextMorph new.
	solicitudTitulo contents: 'Solicitud'.
	solicitudTitulo position: postulanteTitulo position + (260@0).
	self addMorphFront: solicitudTitulo.

	"============================  Boton Fraude  ==========================="
	bFraude := BotonAccion new.
	bFraude label: 'Control Fraude'.
	bFraude position: tablaPropuestas position + (600 @ 20).
	bFraude mouseAction: [ 
		fraudulentas := gestorEmpleos getPropuestasFraudulentas.
		fraudulentas
			ifEmpty: [ 
				UIManager default
					confirm: 'No se han encontrado propuestas fraudulentas'
					label: 'Aviso' ]
			ifNotEmpty: [ 
				tablaFraudulentas := FTTableMorph new.
				tablaFraudulentas dataSource: (FTSimpleDataSource elements:
						 (self convertirPropuestasVisuales: fraudulentas gestor: gestorEmpleos)).
				tablaFraudulentas openInWindowLabeled: 'Fraudulentas' ] ].
	bFraude extent: (200@60).
	bFraude borderStyle: estiloBorde.
	self addMorph: bFraude.
	
	"===========================  Generar Propuestas  ==========================="
	bGenerarPropuestas := BotonAccion new.
	bGenerarPropuestas label: 'Generar Propuestas'.
	bGenerarPropuestas mouseAction: [ gestorEmpleos generarPropuestas ].
	bGenerarPropuestas position: bFraude position + (0 @ 70).
	bGenerarPropuestas extent: (200@60).
	bGenerarPropuestas borderStyle: estiloBorde.
	self addMorph: bGenerarPropuestas.
]

{ #category : #updating }
MenuPropuestas >> update: gestorEmpleos [
	
	gestorEmpleos ifNotNil: [ 
			gestorEmpleos getColPropuestas ifNotNil: [ 
			tablaPropuestas dataSource:
				(FTSimpleDataSource elements:
					 (self convertirPropuestasVisuales:
						  gestorEmpleos getColPropuestas gestor: gestorEmpleos)) ] ]
		 
]
