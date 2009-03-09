announce
announce: aChangeAnnouncement
	| session |
	
	session := self session.
	aChangeAnnouncement subject: self.
	aChangeAnnouncement hasBeenCommitted ifFalse: [
		session inTransaction ifFalse: [CASENoTransaction signal: 'No changes allowed outside a transaction'].
		session reannounce: aChangeAnnouncement].
	^super announce: aChangeAnnouncement