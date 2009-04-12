announce
announce: anAnnouncement
	"Tell my relevant subscribers about anAnnouncement, passing it up the class hierarchy until it reaches CASEAnnouncer."
	| announcement |
	
	announcer ifNotNil:[
	announcement := announcer announce: anAnnouncement withSubject: self reannouncingIfNeeded: true.
	((anAnnouncement shouldBePassedUp) and: [(self name = #CASEAnnouncer) not]) ifTrue: [
		superclass announceAndPassUp: anAnnouncement]].
	^announcement