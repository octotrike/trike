test Boolean logic
testNegatedOr
	| or1 result resultChildren |
	or1 := a \/ b.
	result := or1 negated.
	resultChildren := result children.
	self
		should: [result isAnd];
		
		should: [resultChildren size = 2];
		
		shouldnt: [resultChildren includes: a];
		
		shouldnt: [resultChildren includes: b];
		
		should: [resultChildren first isNegated = true];
		
		should: [resultChildren second isNegated = true]