test representation equivalence
testEquivalenceIdentity
	| and or |
	and := a /\ b.
	or := a \/ b.
	self
		should: [a = a];
		should: [notA = notA];
		should: [and = and];
		should: [or = or]