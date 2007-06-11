test Boolean logic
testNegatedAndOrChildren
	| result resultChildren or1 or2 and1 |
	or1 := a \/ b.
	or2 := c \/ d.
	and1 := or1 /\ or2.
	result := and1 negated.
	resultChildren := result children.
	self
		should: [result isAnd].
	self
		should: [resultChildren size = 4].
	resultChildren
		do: [:child | self
				should: [child isOr]]