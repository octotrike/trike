boolean logic
testAndMyself
	| result |
	result := moonIsFull /\ moonIsFull.
	self
		should: [result = moonIsFull]