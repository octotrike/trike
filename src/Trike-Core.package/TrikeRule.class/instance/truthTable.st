accessing
truthTable
	"Answer a truth table equivalent to me."
	| result |
	result := TrikeTruthTable terms: self atomicTerms.
	self fillTruthTable: result.
	^ result