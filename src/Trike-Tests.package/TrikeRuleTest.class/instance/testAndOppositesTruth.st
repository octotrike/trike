truth tables
testAndOppositesTruth
	| and |
	and := moonIsFull /\ moonIsNotFull.
	self
		should: [and = #Never]