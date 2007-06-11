test Boolean logic
testOrOr
	| result resultChildren or1 or2 |
	or1 := a \/ b.
	or2 := c \/ d.
	result := or1 \/ or2.
	resultChildren := result children.
	self
		should: [result isOr];
		
		should: [resultChildren size = 4];
		
		should: [resultChildren includes: a];
		
		should: [resultChildren includes: b];
		
		should: [resultChildren includes: c];
		
		should: [resultChildren includes: d]