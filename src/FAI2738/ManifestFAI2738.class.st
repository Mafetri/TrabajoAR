"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestFAI2738,
	#superclass : #PackageManifest,
	#category : #'FAI2738-Manifest'
}

{ #category : #'code-critics' }
ManifestFAI2738 class >> ruleCollectionProtocolRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#GestorEmpleos #generarPropuestas #false)) #'2022-01-13T16:16:25.589985-03:00') #(#(#RGMethodDefinition #(#EmpresaSolicitante #invalidarSolicitudesVencidas #false)) #'2022-01-14T15:18:50.484898-03:00') #(#(#RGMethodDefinition #(#EmpresaSolicitante #actualizarSolicitudesResueltas #false)) #'2022-01-14T15:28:37.440076-03:00') #(#(#RGMethodDefinition #(#GestorEmpleos #solicitudesPendientes: #false)) #'2022-01-16T16:32:29.246166-03:00') #(#(#RGMethodDefinition #(#GestorEmpleos #solicitudesPendientesPorFecha: #false)) #'2022-01-16T16:38:53.346853-03:00') #(#(#RGMethodDefinition #(#GestorEmpleos #getPropuestasFraudulentas #false)) #'2022-01-16T16:43:52.97331-03:00') #(#(#RGMethodDefinition #(#GestorEmpleosVisual #convertirPostulantesVisuales: #false)) #'2022-01-20T17:06:35.793526-03:00') #(#(#RGMethodDefinition #(#EmpresaSolicitanteVisual #inicializar: #false)) #'2022-01-22T16:24:27.186608-03:00') )
]
