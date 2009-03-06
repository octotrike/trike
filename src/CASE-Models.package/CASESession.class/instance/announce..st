announce
announce: aChangeAnnouncement
	aChangeAnnouncement hasBeenCommitted 
		ifTrue: [
			reannouncementQueue remove: aChangeAnnouncement]
		ifFalse: [
			self inTransaction ifFalse: [CASENoTransaction signal: 'No changes allowed outside a transaction'].
			reannouncementQueue addLast: aChangeAnnouncement].
	^announcer announce: aChangeAnnouncement