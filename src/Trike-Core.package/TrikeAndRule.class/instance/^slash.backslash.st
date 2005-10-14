instance creation
/\ aRule 
	"Answer myself, with aRule added to my children. nil is a rule which will 
	always answer false."
	^ aRule
		ifNotNil: [children add: aRule.
			"We don't need to perform any change notification because we are now going to be discarded, in favor of our simplified version."
			self simplified]