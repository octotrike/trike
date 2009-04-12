private
announce: anAnnouncement withSubject: aSubject reannouncingIfNeeded: allowReannounce
	| session |

	anAnnouncement isCASEChangeAnnouncement ifTrue: [
		anAnnouncement isBehavior ifTrue: [
			CASECannotAnnounceClass signal: 'Not enough information to automatically instantiate ChangeAnnouncements'].
		session := self session.
		anAnnouncement subject ifNil: [anAnnouncement subject: aSubject].
		anAnnouncement isAboutTo
			ifTrue: [
				session inTransaction ifFalse: [CASENoTransaction signal: 'No changes allowed outside a transaction'].
				allowReannounce ifTrue: [session reannounce: anAnnouncement]]
			ifFalse: [session inTransaction ifTrue: [CASEInTransaction signal: 'Change completion must wait for transaction commit']]].
	^super announce: anAnnouncement

	
	
	
	