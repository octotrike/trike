converting
initializeCodeCombinations
	"Initialize my collection of true terms, in preparation for
	simplification. "
	| singleCells index |
	codeCombinations := Dictionary new.
	singleCells := Set new.
	index := 1.
	grayCodes size
		timesRepeat: [(truthTable at: index)
					= #Always
				ifTrue: [singleCells
						add: (grayCodes at: index)].
			index := index + 1].
	codeCombinations at: 0 put: singleCells