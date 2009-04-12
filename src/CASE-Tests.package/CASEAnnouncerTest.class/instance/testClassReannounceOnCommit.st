class tests
testClassReannounceOnCommit
	"Modeled on CASEAnnouncerTest>>testReannounceOnCommit."
	| announcer spy |

	announcer := self targetClass.
	self session: announcer session.
	spy := self spyOn: announcer.
	self begin.
	announcer announce: CASEAboutToMockA new.
	spy clear.
	self commit.
	self should: [spy announcements only isKindOf: CASEMockedA].