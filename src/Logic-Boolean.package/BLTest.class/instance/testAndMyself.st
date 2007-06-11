test Boolean logic
testAndMyself
	| result |
	result := a /\ a.
	self
		should: [result = a]