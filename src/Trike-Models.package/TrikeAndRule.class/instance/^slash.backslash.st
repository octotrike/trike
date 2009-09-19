instance creation
/\ aRule 
	"Answer myself, with aRule added to my children. nil is a rule
	which will 
	always answer false."
	^ aRule
		ifNotNil: [children add: aRule.
			aRule addParent: self.
			self simplified]