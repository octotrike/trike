converting
asChangedAnnouncement
	"Answer an equivalent instance of me as a ChangedAnnouncement vs. an AboutToChangeAnnouncement."
	| newClass |
	
	newClass := self changedAnnouncementClass.
	newClass ifNil: [self shouldNotImplement].
	^(self class = newClass) 
		ifTrue: [self]
		ifFalse: [newClass from: self]