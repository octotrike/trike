boolean logic
testNegatedAnd
	| and1 result resultChildren |
	and1 := moonIsFull /\ professorForgot.
	result := and1 negated.
	resultChildren := result children.
	self
		should: [result isKindOf: TrikeOrRule].
	self
		should: [resultChildren size = 2].
	self
		shouldnt: [resultChildren includes: moonIsFull].
	self
		shouldnt: [resultChildren includes: professorForgot].
	self
		should: [resultChildren first not = true].
	self
		should: [resultChildren second not = true]