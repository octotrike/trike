accessing
addMorphsTo: aDiagrammer 
	"Add any more morphs which are inherently necessary to display my model properly to aDiagrammer."
	
	graphModel designation ifNotNil: [
		aDiagrammer addMorph: (EMRelationshipLabelMorph on: graphModel designation: #active) for: graphModel].
	graphModel passiveDesignation ifNotNil: [
		aDiagrammer addMorph: (EMRelationshipLabelMorph on: graphModel designation: #passive) for: graphModel]