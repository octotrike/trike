test Boolean logic
testNegatedAtomic
	self
		should: [notA isAtomicTerm];
		
		should: [notA isNegated = true];
		
		shouldnt: [notA asString = a asString]