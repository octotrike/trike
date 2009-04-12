instance tests
testAnnounceChangedOutsideTransaction
	"Modeled on AnnouncerTest>>testAnnounceInstance."
	| announcer changed |

	announcer := self targetClass new.
	self session: announcer session.
	changed := CASEMockedA new.
	self abort.
	self shouldnt: [self inTransaction].
	self should: [(announcer announce: changed) = changed].
	