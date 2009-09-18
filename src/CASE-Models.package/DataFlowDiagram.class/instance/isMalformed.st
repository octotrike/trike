testing
isMalformed
	"Answer whether I violate any of the DFD rules."

	"Each of my components is well-formed."
	self do: [:each |
		each isMalformed ifTrue: [^true]].
	
	"A context diagram can include only one process."
	^self isContext and: [components size != 1]


	