boolean logic
testAndOpposites
	| result |
	result := moonIsFull /\ moonIsNotFull.
	self
		should: [result = #Never]