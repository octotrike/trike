class tests
testClassAnnounceClass
	"Modeled on AnnouncerTest>>testAnnounceClass."
	| announcer |
	
	announcer := self targetClass.
	self should: [(announcer announce: AnnouncementMockA) class = AnnouncementMockA]
