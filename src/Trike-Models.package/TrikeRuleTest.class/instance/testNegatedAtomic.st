boolean logic
testNegatedAtomic
	self
		should: [moonIsNotFull isKindOf: TrikeTextRule].
	self
		should: [moonIsNotFull not = true].
	self
		shouldnt: [moonIsNotFull = moonIsFull].
	self
		shouldnt: [moonIsNotFull asString = moonIsFull asString]