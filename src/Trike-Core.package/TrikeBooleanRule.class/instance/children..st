accessing
children: aCollection 
	"Set my children."
	children
		ifNotNil: [children
				do: [:child | child removeParent: self]].
	children := (aCollection copyWithout: nil) asOrderedCollection.
	"We don't need to perform any change notification or add  
	ourselves as parents because we are now going to be  
	discarded, in favor of our simplified version."
	^ self simplified