testing
hasActiveIssues
	"Answer whether anything in my issues collection, or the issues collections of my subcomponents, is active."
	self issues do: [ :i | i isActive ifTrue: [ ^ true ] ].
	self components do: [ :c | c hasActiveIssues ifTrue: [ ^ true ] ].
	^ false