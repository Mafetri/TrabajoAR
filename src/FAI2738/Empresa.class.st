Class {
	#name : #Empresa,
	#superclass : #Postulante,
	#instVars : [
		'nombre',
		'rubro',
		'producto',
		'puntual',
		'rango'
	],
	#classInstVars : [
		'pesosRango'
	],
	#category : #FAI2738
}

{ #category : #'as yet unclassified' }
Empresa class >> crear: unNombre rubro: unRubro producto: unProducto puntual: esPuntual rango: unRango direccion: unaDireccion contacto: unContacto [

	| empresa |
	empresa := self new.
	empresa
		inicializar: unNombre
		rubro: unRubro
		producto: unProducto
		puntual: esPuntual
		rango: unRango
		direccion: unaDireccion
		contacto: unContacto.
	^ empresa
]

{ #category : #initialization }
Empresa class >> getPesosRango [

	^ pesosRango
]

{ #category : #initialization }
Empresa class >> setPesosRango: pesos [
pesosRango := pesos
]

{ #category : #'as yet unclassified' }
Empresa >> chequearPuntualidad: puntualidadNecesaria [

	^ puntualidadNecesaria = puntual.
]

{ #category : #'as yet unclassified' }
Empresa >> esPersona [
^false
]

{ #category : #Getters }
Empresa >> getNombre [

	^ nombre
]

{ #category : #Getters }
Empresa >> getProducto [

	^ producto
]

{ #category : #Getters }
Empresa >> getPuntual [

	^ puntual
]

{ #category : #Getters }
Empresa >> getRango [

	^ rango
]

{ #category : #Getters }
Empresa >> getRubro [

	^ rubro
]

{ #category : #'as yet unclassified' }
Empresa >> inicializar: unNombre rubro: unRubro producto: unProducto puntual: esPuntual rango: unRango direccion: unaDireccion contacto: unContacto [

	self inicializar: unaDireccion contacto: unContacto.
	nombre := unNombre.
	rubro := unRubro.
	producto := unProducto.
	puntual := esPuntual.
	rango := unRango.
]

{ #category : #Aplicacion }
Empresa >> leCorresponde: caracteristica [
^ rubro = caracteristica.
]

{ #category : #Aplicacion }
Empresa >> maximoPesos: monto [

	| pesos |
	pesos := self class getPesosRango.
	^ rango * pesos >= monto
]

{ #category : #Setters }
Empresa >> setNombre: anObject [

	nombre := anObject
]

{ #category : #Setters }
Empresa >> setProducto: anObject [

	producto := anObject
]

{ #category : #Setters }
Empresa >> setPuntual: anObject [

	puntual := anObject
]

{ #category : #Setters }
Empresa >> setRango: anObject [

	rango := anObject
]

{ #category : #Setters }
Empresa >> setRubro: anObject [

	rubro := anObject
]

{ #category : #'as yet unclassified' }
Empresa >> vendeProduto: unProducto [
	
	^producto = unProducto.
]
