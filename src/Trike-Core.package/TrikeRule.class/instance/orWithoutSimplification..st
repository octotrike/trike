instance creation
orWithoutSimplification: aRule 
	"Answer a new instance of my class which represents my condition or 
	that of aRule, without simplifying anything."

	^self = aRule 
		ifTrue: [self]
		ifFalse: 
			[ | newChildren |
			newChildren := OrderedCollection new.
			newChildren
				add: self;
				add: aRule.
			TrikeOrRule withSimplifiedChildren: newChildren]