instance tests
testAnnounceAboutToInTransaction
	"Modeled on AnnouncerTest>>testAnnounceInstance."
	| announcer aboutTo |

	announcer := self targetClass new.
	self session: announcer session.
	aboutTo := CASEAboutToMockA new.
	self begin.
	self should: [self inTransaction].
	self should: [(announcer announce: aboutTo) = aboutTo].
	self abort.