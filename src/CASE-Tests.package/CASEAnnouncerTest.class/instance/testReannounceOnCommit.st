instance tests
testReannounceOnCommit
	"Confirm that instances of my targetClass will reannounce a Changed version of every AboutTo announcement after the transaction completes."
	| announcer spy |

	announcer := self targetClass new.
	self session: announcer session.
	spy := self spyOn: announcer.
	self begin.
	announcer announce: CASEAboutToMockA new.
	spy clear.
	self commit.
	self should: [spy announcements only isKindOf: CASEMockedA].