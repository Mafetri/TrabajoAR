Class {
	#name : #GestorEmpleosVisual,
	#superclass : #BorderedMorph,
	#instVars : [
		'bCerrar',
		'bMinimizar',
		'bPostulantes',
		'bPropuestas',
		'bEmpresasSolicitantes',
		'bNuevo',
		'bPrecarga',
		'menuEmpresasSolicitantes',
		'menuPostulantes',
		'menuPropuestas',
		'estiloBorde',
		'fecha'
	],
	#category : #FAI2738
}

{ #category : #initialization }
GestorEmpleosVisual >> initialize [
	| origen gestorEmpleos |
	super initialize.
	"===========================  Ventana inicial  ==========================="
	self bounds: (self position extent: 550 @ 700).
	self position: 45 @ 45.
	self color: Color white .
	origen := self innerBounds origin.
	estiloBorde := (RoundedBorderStyle new
                                    cornerRadius: 6;
                                    width: 2;
                                    baseColor: Color black).
	self borderStyle:  estiloBorde.

	"===========================  Modelo  ==========================="
	gestorEmpleos := GestorEmpleos crear: (OrderedCollection new) postulantes: (OrderedCollection new) empresasSolicitantes: OrderedCollection new.
	gestorEmpleos addDependent: self.
	Empresa setPesosRango: 2000.
	Persona setMaxPesos: 5000.

	"===========================  Botones  ==========================="
	"       ----- Creacion ----       "
	bCerrar := BotonAccion new.
	bMinimizar := BotonAccion new.
	bNuevo := BotonAccion new.
	bPrecarga := BotonAccion new.

	"       ----- Posición ----       "
	bCerrar position: (origen + (5@5)).
	bMinimizar position: bCerrar position + (45@0).
	bNuevo position: (origen + (100@500)).
	bPrecarga position: (bNuevo position + (200@0)).
	
	"       ----- Etiquetado ----       "
	bCerrar label: 'Cerrar'.
	bMinimizar label: 'Minimizar'.
	bNuevo label: 'Nuevo'.
	bPrecarga label: 'Precargado'.
	
	"       ----- Tamañio ----       "
	bPrecarga extent: 160@80.
	bNuevo extent: 160@80.
	
	"       ----- Color ----       "
	bCerrar color: Color red.
	bCerrar borderStyle: (RoundedBorderStyle new cornerRadius: 3; width: 2; baseColor: Color black).
	bMinimizar color: Color black .
	bMinimizar borderStyle: (RoundedBorderStyle new cornerRadius: 3; width: 2; baseColor: Color black).
	bNuevo color: Color blue.
	bNuevo borderStyle:  estiloBorde.
	bPrecarga color: Color blue.
	bPrecarga borderStyle: estiloBorde.
	
	"       ----- Asignacion ----       "
	bCerrar mouseAction: [ (UIManager default confirm: 'Seguro que quiere cerrar? Se perdera toda la informacion cargada' label: '======  CUIDADO =====') ifTrue: [ self delete] ].
	bMinimizar mouseAction: [ self collapse ].
	bNuevo mouseAction: [ self menuPrincipal: gestorEmpleos ].
	bPrecarga mouseAction: [ self precarga: gestorEmpleos. self menuPrincipal: gestorEmpleos].
	
	"       ----- Se muestran ----       "
	self addMorph: bCerrar.
	self addMorph: bMinimizar.
	self addMorph: bNuevo.
	self addMorph: bPrecarga.
	
	
	
	
	
	
	
	
	
	
	
	
	
	
]

{ #category : #'as yet unclassified' }
GestorEmpleosVisual >> menuPrincipal: gestorEmpleos [

	self removeMorph: bNuevo.
	self removeMorph: bPrecarga.
	
	fecha := FechaVisual new inicializar: gestorEmpleos posicion: self position.
	self addMorph: fecha.
	
	"===========================  Menús  ==========================="
	menuEmpresasSolicitantes  := MenuEmpresasSolicitantes new inicializar: gestorEmpleos.
	menuPostulantes := MenuPostulantes new inicializar: gestorEmpleos.
	menuPropuestas := MenuPropuestas new inicializar: gestorEmpleos.

	"===========================  Botones  ==========================="
	"       ----- Creacion ----       "
	bPostulantes := BotonAccion new.
	bPropuestas := BotonAccion new.
	bEmpresasSolicitantes := BotonAccion new.
	
	"       ----- Posición ----       "
	bPostulantes position: (self position + (40@500)).
	bPropuestas position: bPostulantes position + (155@0).
	bEmpresasSolicitantes position: bPropuestas position + (155@0).
	
	"       ----- Etiquetado ----       "
	bPostulantes label: 'Postulantes'.
	bPropuestas label: 'Propuestas'.
	bEmpresasSolicitantes label: 'Empresas Solicitantes'.
	
	"       ----- Tamaño ----       "
	bPostulantes extent: 140@60.
	bPropuestas extent: 140@60.
	bEmpresasSolicitantes extent: 140@60.
	
	"       ----- Color ----       "
	bPostulantes color: Color blue.
	bPostulantes borderStyle: estiloBorde.
	bPropuestas color: Color blue.
	bPropuestas borderStyle: estiloBorde.
	bEmpresasSolicitantes color: Color blue.
	bEmpresasSolicitantes borderStyle: estiloBorde.
	
	"       ----- Asignacion ----       "
	bPostulantes mouseAction: [ menuPostulantes openInWorld. ].
	bPropuestas mouseAction: [ menuPropuestas openInWorld ].
	bEmpresasSolicitantes mouseAction: [ menuEmpresasSolicitantes openInWorld. ].
	
	"       ----- Se muestran ----       "
	self addMorph: bPostulantes.
	self addMorph: bPropuestas.
	self addMorph: bEmpresasSolicitantes.
]

{ #category : #'as yet unclassified' }
GestorEmpleosVisual >> precarga: gestorEmpleos [

	|col|
	
	" ========== Postulantes ========="
	" ---- Personas ----"
	col := OrderedCollection new.
	col add: 'Plomero'.
	gestorEmpleos agregarPostulante: (Persona crear: 'José Guitierrez' aptitudes: col direccion: 'Las Heras 1240' contacto: 2995305833).
	
	col := OrderedCollection new.
	col add: 'Plomero'.
	col add: 'Electricista'.
	gestorEmpleos agregarPostulante: (Persona crear: 'Hernan Alvarez' aptitudes: col direccion: 'San Martin 230' contacto: 2995305993).
	
	col := OrderedCollection new.
	col add: 'Programador'.
	gestorEmpleos agregarPostulante: (Persona crear: 'Maria Lopez' aptitudes: col direccion: 'Juan B Justo 1893' contacto: 2995874993).
			
	col := OrderedCollection new.
	col add: 'Limpieza'.
	gestorEmpleos agregarPostulante: (Persona crear: 'Antonio Garcia' aptitudes: col direccion: 'San Martin 230' contacto: 2995305364).
	
	" ---- Empresas ----"
	gestorEmpleos agregarPostulante: (Empresa crear: 'Zakura' rubro: 'Plomero' producto: 'Canillas'  puntual: false rango: 3 direccion: 'San Martin 2000'  contacto: 2994478399).
	gestorEmpleos agregarPostulante: (Empresa crear: 'Plomeros a Puerta' rubro: 'Plomero' producto: nil  puntual: true rango: 1 direccion: 'San Martin 2000'  contacto: 2995475889).	
	gestorEmpleos agregarPostulante: (Empresa crear: 'Plumbers SA' rubro: 'Plomero' producto: 'Canillas'  puntual: true rango: 3 direccion: 'San Martin 2000'  contacto: 2994478399).
	gestorEmpleos agregarPostulante: (Empresa crear: 'Limpieza Inc.' rubro: 'Limpieza' producto: nil  puntual: true rango: 3 direccion: 'San Martin 2000'  contacto: 2994475599).
	gestorEmpleos agregarPostulante: (Empresa crear: 'Google' rubro: 'Programador' producto: nil  puntual: false rango: 3 direccion: 'San Martin 2000'  contacto: 2995475889).

	"=============== Empresas Solicitantes ============"
	col := OrderedCollection new.
	col add: (DeTrabajo crear: 'Programador' numeroIdentificatorio: 01 fecha: Date today monto: 1000 pendiente: true tiempoValidez: 1).
	col add: (DeServicio crear: 'Limpieza' frecuenciaDePago: 'Mensual' duracion: 3 tipoDuracion: 'Meses' producto: nil  numeroIdentificatorio: 2  fecha: Date today monto: 3000  pendiente: true tiempoValidez: 10 ).
	col add: (DeServicio crear: 'Plomero' frecuenciaDePago: 'Mensual' duracion: 3 tipoDuracion: 'Meses' producto: 'Canillas'  numeroIdentificatorio: 3  fecha: Date today monto: 3000  pendiente: true tiempoValidez: 5 ).
	
	gestorEmpleos agregarSoliciante: (EmpresaSolicitante
			 crear: col
			 resueltas: OrderedCollection new
			 invalidas: OrderedCollection new
			 nombre: 'Astra'
			 rubro: 'Programacion'
			 producto: nil
			 puntual: false
			 rango: 3
			 direccion: 'Roca '
			 contacto: 29905930280).
		
	col := OrderedCollection new.
	col add: (DeServicio crear: 'Plomero' frecuenciaDePago: 'Mensual' duracion: 3 tipoDuracion: 'Meses' producto: nil  numeroIdentificatorio: 4  fecha: Date today monto: 6000  pendiente: true tiempoValidez: 4 ).
	col add: (DeServicio crear: 'Plomero' frecuenciaDePago: 'Mensual' duracion: 0 tipoDuracion: 'Meses' producto: nil  numeroIdentificatorio: 5  fecha: Date today monto: 3000  pendiente: true tiempoValidez: 6 ).
	gestorEmpleos agregarSoliciante: (EmpresaSolicitante
			 crear: col
			 resueltas: OrderedCollection new
			 invalidas: OrderedCollection new
			 nombre: 'FerroWorld'
			 rubro: 'Ferreteria'
			 producto: nil
			 puntual: false
			 rango: 3
			 direccion: 'Roca '
			 contacto: 29905930280).
]
