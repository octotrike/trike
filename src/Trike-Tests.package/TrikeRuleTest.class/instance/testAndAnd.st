boolean logic
testAndAnd
	| and1 and2 result resultChildren |
	and1 := moonIsFull /\ professorForgot.
	and2 := timeMovingForwards /\ creatureLives.
	result := and1 /\ and2.
	resultChildren := result children.
	self
		should: [result isKindOf: TrikeAndRule].
	self
		should: [resultChildren size = 4].
	self
		should: [resultChildren includes: moonIsFull].
	self
		should: [resultChildren includes: professorForgot].
	self
		should: [resultChildren includes: timeMovingForwards].
	self
		should: [resultChildren includes: creatureLives]