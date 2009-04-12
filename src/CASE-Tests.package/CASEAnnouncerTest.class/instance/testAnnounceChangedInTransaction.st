instance tests
testAnnounceChangedInTransaction
	"Confirm that instances of my targetClass cannot announce Changed inside a transaction."
	| announcer changed |
	
	announcer := self targetClass new.
	self session: announcer session.
	changed := CASEMockedA new.
	self begin.
	self should: [self inTransaction].
	self should: [self targetClass announce: changed] raise: CASEInTransaction.
	self abort.
