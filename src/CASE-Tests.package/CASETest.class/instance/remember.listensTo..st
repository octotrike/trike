accessing
remember: aListener listensTo: anAnnouncer
	"Answer a (possibly new) AnouncementSpy on anAnnouncer."
	
	^(listeners at: anAnnouncer ifAbsentPut: IdentitySet new) add: aListener 