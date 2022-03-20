Class {
	#name : #EmpresaVisual,
	#superclass : #PostulanteVisual,
	#instVars : [
		'nombre',
		'rubro',
		'producto',
		'puntual',
		'rango'
	],
	#category : #FAI2738
}

{ #category : #'as yet unclassified' }
EmpresaVisual class >> crear: empresa [

	|empresaVisual|
	empresaVisual := self new.
	empresaVisual inicializar: empresa.
	^empresaVisual.
]

{ #category : #'as yet unclassified' }
EmpresaVisual >> inicializar: empresa [

	self color: Color darkGray.
	self bounds: (self position extent: 900@90).
	
	nombre := TextMorph new.
	nombre contents: empresa getNombre.
	
	rubro := TextMorph new.
	rubro contents: empresa getRubro.
	rubro position: nombre position + (150@0).
	
	producto := TextMorph new.
	producto contents: (empresa getProducto ifNil: [ 'Sin producto' ] ifNotNil: [ empresa getProducto ]).
	producto position: rubro position + (150@0).
	
	puntual := TextMorph new.
	empresa getPuntual ifTrue: [ puntual contents: 'Si' ] ifFalse: [ puntual contents: 'No' ].
	puntual position: producto position + (150@0).
	
	rango := TextMorph new.
	rango contents: empresa getRango asString.
	rango position: puntual position + (60@0).
	
	self addMorph: nombre.
	self addMorph: rubro.
	self addMorph: producto.
	self addMorph: puntual.
	self addMorph: rango.
	self inicializar: empresa posicion: rango position - (90@0). 
	
	
	
]

{ #category : #'as yet unclassified' }
EmpresaVisual >> inicializarVertical: empresa [
	
	|nombreTitulo rubroTitulo productoTitulo esPuntualTitulo rangoTitulo|

	self color: Color darkGray.
	self bounds: (self position extent: 250@150).
	
	nombreTitulo := TextMorph new.
	nombreTitulo contents: 'Nombre: '.
	nombre := TextMorph new.
	nombre contents: empresa getNombre.
	nombre position: nombreTitulo position + (80@0).
	
	rubroTitulo := TextMorph new.
	rubroTitulo contents: 'Rubro: '.
	rubroTitulo position: nombreTitulo position + (0@20).
	rubro := TextMorph new.
	rubro contents: empresa getRubro.
	rubro position: rubroTitulo position + (80@0).
	
	productoTitulo := TextMorph new.
	productoTitulo contents: 'Producto: '.
	productoTitulo position: rubroTitulo position + (0@20).
	producto := TextMorph new.
	producto contents: (empresa getProducto ifNil: [ 'Sin producto' ] ifNotNil: [ empresa getProducto ]).
	producto position: productoTitulo position + (80@0).
	
	esPuntualTitulo := TextMorph new.
	esPuntualTitulo contents: 'Puntual: '.
	esPuntualTitulo position: productoTitulo position + (0@20).
	puntual := TextMorph new.
	empresa getPuntual ifTrue: [ puntual contents: 'Si' ] ifFalse: [ puntual contents: 'No' ].
	puntual position: esPuntualTitulo position + (80@0).
	
	rangoTitulo := TextMorph new.
	rangoTitulo contents: 'Rango: '.
	rangoTitulo position: esPuntualTitulo position + (0@20).
	rango := TextMorph new.
	rango contents: empresa getRango asString.
	rango position: rangoTitulo position + (80@0).
	
	self addMorph: nombre.
	self addMorph: nombreTitulo.
	self addMorph: rubro.
	self addMorph: rubroTitulo.
	self addMorph: producto.
	self addMorph: productoTitulo.
	self addMorph: puntual.
	self addMorph: esPuntualTitulo.
	self addMorph: rango.
	self addMorph: rangoTitulo.
	self inicializarVertical: empresa posicion: rangoTitulo position.
]
