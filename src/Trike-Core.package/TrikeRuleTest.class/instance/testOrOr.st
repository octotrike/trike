boolean logic
testOrOr
	| result resultChildren or1 or2 |
	or1 := moonIsFull \/ professorForgot.
	or2 := timeMovingForwards \/ creatureLives.
	result := or1 \/ or2.
	resultChildren := result children.
	self
		should: [result isKindOf: TrikeOrRule].
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