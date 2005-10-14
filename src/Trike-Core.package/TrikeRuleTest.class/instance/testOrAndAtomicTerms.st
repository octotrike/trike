boolean logic
testOrAndAtomicTerms
	| result or1 and1 and2 |
	and1 := moonIsFull /\ professorForgot.
	and2 := timeMovingForwards /\ creatureLives.
	or1 := and1 \/ and2.
	result := or1 atomicTerms.	self
		should: [result size = 4].
	self
		should: [result includes: moonIsFull].
	self
		should: [result includes: professorForgot].
	self
		should: [result includes: timeMovingForwards].
	self
		should: [result includes: creatureLives]