testing
hasIssues
	"Answer whether there is anything in my issues collection, or the issues collections of my subcomponents."
	self issues 
		ifEmpty: [ self components do: [ :c | c hasIssues ifTrue: [ ^ true ] ] ]
		ifNotEmpty: [ ^ true ].
	^ false