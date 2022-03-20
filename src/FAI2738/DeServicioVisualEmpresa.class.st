Class {
	#name : #DeServicioVisualEmpresa,
	#superclass : #DeServicioVisual,
	#instVars : [
		'empresa',
		'bMasInfo'
	],
	#category : #FAI2738
}

{ #category : #'as yet unclassified' }
DeServicioVisualEmpresa >> inicializarVertical: solicitud empresa: unaEmpresa [

	| empresaTitulo |
	self inicializarVertical: solicitud.
	
	empresaTitulo := TextMorph new.
	empresaTitulo contents: 'Empresa:'.
	empresaTitulo position: producto position + (-130@20).
	empresa := TextMorph new.
	empresa contents: unaEmpresa getNombre.
	empresa position: empresaTitulo position + (130@0).
	
	bMasInfo := BotonAccion new.
	bMasInfo label: 'Mas Info'.
	bMasInfo position: empresa position + (100@0).
	bMasInfo mouseAction: [ (EmpresaSolicitanteVisual new inicializarVertical: unaEmpresa) openInWindowLabeled: empresa contents].
	
	self addMorph: empresaTitulo.
	self addMorph: empresa.
	self addMorph: bMasInfo.
	
	
	
]
