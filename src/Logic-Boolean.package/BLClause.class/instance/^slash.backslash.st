instance creation
/\ aClause 
	"Answer a new instance of my class which represents my condition  
	and that of aClause."
	^ aClause
		ifNotNil: [| newChildren | 
			newChildren := OrderedCollection new.
			newChildren add: self;
				
				addAllFirstUnlessAlreadyPresent: (Array with: aClause).
			BLAnd withChildren: newChildren]