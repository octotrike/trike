test Boolean logic
testOrOpposites
	| or |
	or := a \/ notA.
	self
		should: [or isTrue]