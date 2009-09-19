boolean logic
testOrOpposites
	| result |
	result := moonIsFull \/ moonIsNotFull.
	self
		should: [result = #Always]