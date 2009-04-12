instance tests
testAnnounceClass
	"Modeled on AnnouncerTest>>testAnnounceClass."
	| announcer |
	
	announcer := self targetClass new.
	self should: [(announcer announce: AnnouncementMockA) class = AnnouncementMockA]
