convenience
on: anAnnouncementClass send: aSelector to: anObject
	^announcer ifNotNil: [announcer on: anAnnouncementClass send: aSelector to: anObject].