test Boolean logic
testAndOpposites
	| and |
	and := a /\ notA.
	self
		should: [and isFalse]