class tests
testClassAnnounceCASEClass
	"Modeled on CASEAnnouncerTest>>testAnnounceCASEClass."
	| announcer |
	
	announcer := self targetClass.
	self should: [announcer announce: CASEChangeAnnouncement] raise: CASECannotAnnounceClass