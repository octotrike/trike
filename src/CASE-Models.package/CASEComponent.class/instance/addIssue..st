accessing
addIssue: anIssue
	"Add an Issue that pertains to me."
	
	(issues includes: anIssue) ifTrue: [
		"anIssue is already one of my issues."
		^nil].
	
	self noBalanceAddIssue: anIssue.
	anIssue noBalanceAdd: self.
	
	self passTriggerUp: #addIssue with: anIssue.
	anIssue triggerEvent: #addComponent with: self.
	(anIssue isActive and: [self activeIssues size = 1]) ifTrue: [
		self triggerHasActiveIssues: true].
	
	^anIssue
			