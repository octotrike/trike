boolean logic
testAndOrAtomicTerms
	| result or1 or2 and1 |
	or1 := moonIsFull \/ professorForgot.
	or2 := timeMovingForwards \/ creatureLives.
	and1 := or1 /\ or2.
	result := and1 atomicTerms.
	self
		should: [result size = 4].
	self
		should: [result includes: moonIsFull].
	self
		should: [result includes: professorForgot].
	self
		should: [result includes: timeMovingForwards].
	self
		should: [result includes: creatureLives].