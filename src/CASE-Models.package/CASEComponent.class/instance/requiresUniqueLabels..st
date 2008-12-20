accessing
requiresUniqueLabels: newBoolean
	"Set whether each of my components is required to have a unique label.  True by default, but subclasses must set to false if each type of component has its own name space."
	
	requiresUniqueLabels = newBoolean ifFalse: [ | oldBoolean |
		requiresUniqueLabels := newBoolean.
		requiresUniqueLabels
			ifTrue: [self openDuplicateLabelIssues]
			ifFalse: [self resolveDuplicateLabelIssues]]