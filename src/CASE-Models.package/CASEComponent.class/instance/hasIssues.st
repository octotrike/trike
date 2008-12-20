testing
hasIssues
	"Answer whether there is anything in my issues collection, or the issues collections of my subcomponents."
	
	issues 
		ifEmpty: [self subcomponents do: [:c | c hasIssues ifTrue: [^true]]]
		ifNotEmpty: [^true].
	^false