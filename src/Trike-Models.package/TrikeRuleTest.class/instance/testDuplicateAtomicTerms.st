boolean logic
testDuplicateAtomicTerms
	| result or1 and1 and2 |
	and1 := moonIsFull /\ professorForgot.
	and2 := timeMovingForwards /\ moonIsFull.
	or1 := and1 \/ and2.
	result := or1 atomicTerms.
	self
		should: [result size = 3].
	self
		should: [result includes: moonIsFull].
	self
		should: [result includes: professorForgot].
	self
		should: [result includes: timeMovingForwards].
