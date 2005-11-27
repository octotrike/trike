boolean logic
testAndOppositeActors
	| result |
	result := isStudent /\ isNotStudent.
	self
		should: [result = #never]