private
announceAndPassUp: anAnnouncement 
	"Tell my relevant subscribers about anAnnouncement, passing it up the class hierarchy until it reaches CASEAnnouncer."
	| announcement |
	
	announcement := announcer announce: anAnnouncement withSubject: self reannouncingIfNeeded: false.
	(self name = #CASEAnnouncer) ifFalse: [
		superclass announceAndPassUp: anAnnouncement].
	^announcement