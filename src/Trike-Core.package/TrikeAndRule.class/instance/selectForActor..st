accessing
selectForActor: anActor 
	"Answer #always, #never, or a rule that is equivalent to me
	when an 
	actor is anActor."
	| clauses |
	clauses := OrderedCollection new.
	children
		do: [:child | 
			| childClause | 
			childClause := child selectForActor: anActor.
			childClause = #Never
				ifTrue: [^ #Never].
			childClause = #Always
				ifFalse: [clauses
						addAllFirstUnlessAlreadyPresent: (Array with: childClause)]].
	clauses
		ifEmpty: [^ #Always].
	clauses size = 1
		ifTrue: [^ clauses anyOne].
	^ self class withChildren: clauses