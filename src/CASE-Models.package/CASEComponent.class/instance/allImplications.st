accessing
allImplications
	"Answer the Set of Implications that pertain to me and my subcomponents."
	| answer |
	
	answer := implications copy.
	self subcomponents do: [:c |
		answer addAll: c allImplications].
	^answer