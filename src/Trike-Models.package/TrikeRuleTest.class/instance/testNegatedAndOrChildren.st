boolean logic
testNegatedAndOrChildren
	| result resultChildren or1 or2 and1 |
	or1 := moonIsFull \/ professorForgot.
	or2 := timeMovingForwards \/ creatureLives.
	and1 := or1 /\ or2.
	result := and1 negated.
	resultChildren := result children.
	self
		should: [result isKindOf: TrikeAndRule].
	self
		should: [resultChildren size = 4].
	resultChildren do: [:child |
		self
			should: [child isKindOf: TrikeOrRule]].