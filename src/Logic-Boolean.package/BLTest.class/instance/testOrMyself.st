test Boolean logic
testOrMyself
	| result |
	result := a \/ a.
	self
		should: [result = a]