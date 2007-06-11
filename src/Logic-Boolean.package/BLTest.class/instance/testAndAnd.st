test Boolean logic
testAndAnd
	| and1 and2 result resultChildren |
	and1 := a /\ b.
	and2 := c /\ d.
	result := and1 /\ and2.
	resultChildren := result children.
	self
		should: [result isAnd];
		
		should: [resultChildren size = 4];
		
		should: [resultChildren includes: a];
		
		should: [resultChildren includes: b];
		
		should: [resultChildren includes: c];
		
		should: [resultChildren includes: d]