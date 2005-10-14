instance creation
/\ aRule 
	"Answer a new instance of my class which represents my condition  
	and that of aRule."
	^ aRule
		ifNotNil: [| newChildren | 
			newChildren := OrderedCollection new.
			newChildren add: self;
				
				addAllFirstUnlessAlreadyPresent: (Array with: aRule).
			TrikeAndRule withChildren: newChildren]