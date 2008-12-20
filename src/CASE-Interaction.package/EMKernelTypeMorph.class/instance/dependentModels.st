accessing
dependentModels
	"Answer any more models which need to be displayed to display my model properly."
	^graphModel ifNil: [#()] ifNotNil: [graphModel attributes]