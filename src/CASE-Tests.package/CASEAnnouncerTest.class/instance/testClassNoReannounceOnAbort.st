class tests
testClassNoReannounceOnAbort
	"Modeled on CASEAnnouncerTest>>testNoReannounceOnAbort."
	| announcer spy |

	announcer := self targetClass.
	self session: announcer session.
	spy := self spyOn: announcer.
	self begin.
	announcer announce: CASEAboutToMockA new.
	spy clear.
	self abort.
	self should: [spy announcements isEmpty].	