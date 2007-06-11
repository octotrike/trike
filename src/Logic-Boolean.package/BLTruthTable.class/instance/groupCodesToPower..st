converting
groupCodesToPower: power 
	"Create the next largest group of grayCodes."

	| sourceCodes groups |
	sourceCodes := codeCombinations at: power - 1.
	groups := Set new.
	sourceCodes do: [:sourceCode | sourceCode unmark].
	sourceCodes do: 
			[:codeToCombine | 
			sourceCodes do: 
					[:combinationCandidate | 
					| combinedCode |
					codeToCombine = combinationCandidate 
						ifFalse: [
							combinedCode := codeToCombine /\ combinationCandidate.
							combinedCode ifNotNil: [
								codeToCombine mark.
								combinationCandidate mark.
								groups add: combinedCode]]]].
	sourceCodes removeAllSuchThat: [:code | code isMarked].
	codeCombinations at: power put: groups