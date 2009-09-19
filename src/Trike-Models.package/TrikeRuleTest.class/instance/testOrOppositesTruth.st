truth tables
testOrOppositesTruth
	| or |
	or := moonIsFull \/ moonIsNotFull.
	self
		should: [or = #Always]