boolean logic
testNegatedOr
	| or1 result resultChildren |
	or1 := moonIsFull \/ professorForgot.
	result := or1 negated.
	resultChildren := result children.
	self
		should: [result isKindOf: TrikeAndRule].
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