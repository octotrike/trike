class tests
testClassAnnounceInstance
	"Modeled on AnnouncerTest>>testAnnounceInstance."
	| announcer announcement |
	
	announcer := self targetClass.
	announcement := AnnouncementMockA new.
	self should: [(announcer announce: announcement) = announcement]