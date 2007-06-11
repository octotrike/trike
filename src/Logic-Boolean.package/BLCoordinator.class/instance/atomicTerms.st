accessing
atomicTerms
	"Answer a Set of my atomic terms."
	| result |
	result := OrderedCollection new.
	self children
		do: [:child | child
				ifNotNil: [result addAllFirstUnlessAlreadyPresent: child atomicTerms]].
	^ result