accessing
orWithoutSimplification: aRule 
	"Answer myself, with aRule added to my children, without simplifying 
	anything. "
	children
		addAllFirstUnlessAlreadyPresent: (OrderedCollection with: aRule).
	aRule addParent: self.
	self triggerEvent: #rule