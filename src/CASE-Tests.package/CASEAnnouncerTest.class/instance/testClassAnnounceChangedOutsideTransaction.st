class tests
testClassAnnounceChangedOutsideTransaction
	"Modeled on CASEAnnouncerTest>>testAnnounceChangedOutsideTransaction."
	| announcer changed |
	
	announcer := self targetClass.
	self session: announcer session.
	changed := CASEMockedA new.
	self abort.
	self shouldnt: [self inTransaction].
	self should: [(announcer announce: changed) = changed].
	