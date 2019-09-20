converting
ruleFromCodeCombinations
	"Six:Output results by displaying the terms for the minterms
	that 
	weren't joined into higher order groupings, groupings of two
	cells, 
	groupings of four cells, . . . until all the terms are displayed."
	| terms |
	self flag: #todo. 
	"Should implement extra step."
	terms := OrderedCollection new.
	codeCombinations size - 1
		to: 0
		by: -1
		do: [:power | (codeCombinations at: power)
				do: [:code | terms add: code equivalentRule]].
	terms
		ifEmpty: [^ #Never].
	terms size = 1
		ifTrue: [^ terms anyOne].
	^ TrikeOrRule withSimplifiedChildren: terms