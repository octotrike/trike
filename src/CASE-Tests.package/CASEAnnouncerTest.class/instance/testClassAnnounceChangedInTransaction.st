class tests
testClassAnnounceChangedInTransaction
	"Modeled on CASEAnnouncerTest>>testAnnounceChangedInTransaction."
	| announcer changed |
	
	announcer := self targetClass.
	self session: announcer session.
	changed := CASEMockedA new.
	self begin.
	self should: [self inTransaction].
	self should: [announcer announce: changed] raise: CASEInTransaction.
	self abort.