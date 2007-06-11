converting
asTruthTable
	"Answer a truth table equivalent to me."
	| result |
	result := BLTruthTable terms: self atomicTerms.
	self fillTruthTable: result.
	^ result