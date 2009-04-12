instance tests
testNoReannounceOnAbort
	"Confirm that instances of my targetClass do not make a Changed announcement for an AboutTo announcement if the transaction aborts."
	| announcer spy |

	announcer := self targetClass new.
	self session: announcer session.
	spy := self spyOn: announcer.
	self begin.
	announcer announce: CASEAboutToMockA new.
	spy clear.
	self abort.
	self should: [spy announcements isEmpty].	