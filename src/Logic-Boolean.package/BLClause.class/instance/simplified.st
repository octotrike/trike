simplification
simplified
	"Answer a simplified version of myself."
	^ self
		ifNotNil: [self asTruthTable equivalentClause]