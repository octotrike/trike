instance creation
\/ aRule 
	"Answer myself, with aRule added to my children."
	children
		addAllFirstUnlessAlreadyPresent: (OrderedCollection with: aRule).
	"We don't need to perform any change notification because we are now going to be discarded, in favor of our simplified version."
	^self simplified