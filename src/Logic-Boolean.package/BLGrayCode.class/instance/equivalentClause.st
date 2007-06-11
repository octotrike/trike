converting
equivalentClause
	"Answer a clause which is equivalent to me given my truthTable's
	atomicTerms."
	| atomicTerms terms i |
	atomicTerms := truthTable atomicTerms.
	terms := OrderedCollection new.
	i := 1.
	index
		do: [:character | 
			character = $1
				ifTrue: [terms
						add: (atomicTerms at: i)].
			character = $0
				ifTrue: [terms add: (atomicTerms at: i) negated].
			i := i + 1].
	terms
		ifEmpty: [^BLTrue initializedInstance].
	terms size = 1
		ifTrue: [^ terms only].
	^ BLAnd withSimplifiedChildren: terms