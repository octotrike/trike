event handling
addNodesAction: parent
	"Answer an OrderedCollection containing operations for adding each 
	type of rule I support to the given parent."
	
	^(self concreteSubclasses collect: [:c |
		c addNodeAction: parent]) copyWithout: nil