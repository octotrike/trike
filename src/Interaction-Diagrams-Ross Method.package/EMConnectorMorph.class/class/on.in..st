instance creation
on: graphModel in: aDiagrammer 
	"Answer a new instance of me with the given graphModel as part of a display controlled by diagrammer.  Assumes all objects I connect have already been created by aDiagrammer."
	
	^(self new)
		graphModel: graphModel;
		initializeEndsIn: aDiagrammer