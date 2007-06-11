instance creation
\/ aClause
	"Answer a new instance of my class which represents my condition or 
	that of aClause."

	^self = aClause 
		ifTrue: [self]
		ifFalse: 
			[ | newChildren |
			newChildren := OrderedCollection new.
			newChildren
				add: self;
				add: aClause.
			BLOr withChildren: newChildren]