accessing
children: aCollection 
	"Set my children."
	children
		ifNotNil: [children do: [:child | child removeParent: self]].
	children := aCollection asOrderedCollection.
	children
		do: [:child | child addParent: self].
	^self simplified