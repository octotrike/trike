instance tests
testAnnounceInstance
	"Modeled on AnnouncerTest>>testAnnounceInstance."
	| announcer announcement |
	
	announcer := self targetClass new.
	announcement := AnnouncementMockA new.
	self should: [(announcer announce: announcement) = announcement]
