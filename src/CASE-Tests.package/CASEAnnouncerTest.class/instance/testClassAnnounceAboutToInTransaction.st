class tests
testClassAnnounceAboutToInTransaction
	"Modeled on CASEAnnouncerTest>>testAnnounceAboutToInTransaction."
	| announcer aboutTo |

	announcer := self targetClass.
	self session: announcer session.
	aboutTo := CASEAboutToMockA new.
	self begin.
	self should: [self inTransaction].
	self should: [(announcer announce: aboutTo) = aboutTo].
	self abort.
