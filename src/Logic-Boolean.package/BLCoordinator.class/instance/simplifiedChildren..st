accessing
simplifiedChildren: aCollection 
	"Set my children, without simplifying."
	children
		ifNotNil: [children do: [:child | child removeParent: self]].
	children := aCollection asOrderedCollection.
	children
		do: [:child | child addParent: self].
	self triggerEvent: #children