test Boolean logic
testNegatedAnd
	| and1 result resultChildren |
	and1 := a /\ b.
	result := and1 negated.
	resultChildren := result children.
	self
		should: [result isOr];
		
		should: [resultChildren size = 2];
		
		shouldnt: [resultChildren includes: a];
		
		shouldnt: [resultChildren includes: b];
		
		should: [resultChildren first isNegated = true];
		
		should: [resultChildren second isNegated = true]