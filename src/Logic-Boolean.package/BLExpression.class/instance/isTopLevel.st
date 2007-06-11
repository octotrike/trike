testing
isTopLevel
	"Answer whether my parents are all non-clause parents."
	
	^parents isNil or: [parents noneSatisfy: [:parent | parent isBooleanExpression]]
