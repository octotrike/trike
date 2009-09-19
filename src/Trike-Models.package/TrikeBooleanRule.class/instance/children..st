accessing
children: aCollection 
	"Set my children."
	children
		ifNotNil: [children
				do: [:child | child removeParent: self]].
	children := (aCollection copyWithout: nil) asOrderedCollection.
	children
		do: [:child | child addParent: self].
	^ self simplified