instance creation
equivalentIn: anotherTruthTable 
	"Answer an instance of my class which is equivalent to me, but in 
	anotherTruthTable.   My truthTable's atomicTerms is assumed to be
	a subset of anotherTruthTable's atomicTerms."

	| result otherTerms myTerms i |
	myTerms := truthTable atomicTerms.
	otherTerms := anotherTruthTable atomicTerms.
	result := String new: otherTerms size.
	i := 1.
	index do: 
			[:character | 
			('01' includes: character) 
				ifTrue: [result at: (otherTerms indexOf: (myTerms at: i)) put: character].
			i := i + 1].
	1 to: otherTerms size
		do: [:j | (myTerms includes: (otherTerms at: j)) ifFalse: [result at: j put: $?]].
	^self class index: result in: anotherTruthTable