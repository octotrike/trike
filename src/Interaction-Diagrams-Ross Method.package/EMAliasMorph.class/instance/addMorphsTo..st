accessing
addMorphsTo: aDiagrammer 
	"Add any more morphs which are inherently necessary to display my model properly to aDiagrammer."
	
	aDiagrammer addMorph: (EMAliasConnectionMorph on: graphModel in: aDiagrammer) for: graphModel