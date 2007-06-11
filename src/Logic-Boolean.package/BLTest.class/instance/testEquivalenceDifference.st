test representation equivalence
testEquivalenceDifference
	self
		shouldnt: [a = b];
		
		shouldnt: [a = notA];
		
		shouldnt: [(a /\ b) = (a \/ b)];
		
		shouldnt: [(a /\ b) = (c /\ b)];
		
		shouldnt: [(a \/ b) = (c \/ b)]