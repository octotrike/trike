selection by actor
testSelectByActorAtomic
	| result |
	result := moonIsFull selectForActor: student.
	self
		should: [result = moonIsFull]