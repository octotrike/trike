instance creation
withSimplifiedChildren: children 
	"Answer a new instance of myself with the given children, without simplifying them."
	^ self new simplifiedChildren: children asOrderedCollection