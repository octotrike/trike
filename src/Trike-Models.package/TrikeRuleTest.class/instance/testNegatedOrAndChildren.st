boolean logic
testNegatedOrAndChildren
	| result resultChildren or1 and1 result1 result2 and2 |
	and1 := moonIsFull /\ professorForgot.
	and2 := timeMovingForwards /\ creatureLives.
	or1 := and1 \/ and2.
	result := or1 negated.
	resultChildren := result children.
	result1 := result children first.
	result2 := result children second.
	self
		should: [result isKindOf: TrikeAndRule].
	self
		should: [resultChildren size = 2].
	self
		should: [result1 isKindOf: TrikeOrRule].
	self
		should: [result2 isKindOf: TrikeOrRule]