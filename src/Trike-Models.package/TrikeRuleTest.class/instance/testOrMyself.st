boolean logic
testOrMyself
	| result |
	result := moonIsFull \/ moonIsFull.
	self
		should: [result = moonIsFull]