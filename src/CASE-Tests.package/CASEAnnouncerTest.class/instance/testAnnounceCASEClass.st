instance tests
testAnnounceCASEClass
	"Confirm that CASEChangeAnnouncements must be instantiated before they are announced."
	| announcer |
	
	announcer := self targetClass new.
	self should: [announcer announce: CASEChangeAnnouncement] raise: CASECannotAnnounceClass