accessing
spyOn: anAnnouncer
	"Answer a (possibly new) AnouncementSpy on anAnnouncer."
	
	^spies at: anAnnouncer ifAbsentPut: [AnnouncementSpy on: anAnnouncer]