actions
addClausesAction: parent
	"Answer an OrderedCollection containing operations for adding each 
	type of clause I support to the given parent."
	
	^(self subclassesWantingNewInstances collect: [:c |
		c addClauseAction: parent]) copyWithout: nil