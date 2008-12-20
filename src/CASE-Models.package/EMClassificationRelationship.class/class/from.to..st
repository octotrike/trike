instance creation
from: supertype to: subtypes
	"Answer a new instance of me representing an entity type hierarchy (ETH) between supertype and subtypes."
	
	^(self new)
		supertype: supertype;
		subtypes: subtypes;
		yourself