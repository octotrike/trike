accessing
removeIssue: anIssue
	"Remove an Issue that no longer pertains to me."
	
	(issues includes: anIssue) ifFalse: [
		"anIssue is not one of my issues."
		^nil].
	
	self noBalanceRemoveIssue: anIssue.
	anIssue noBalanceRemove: self.
	
	self passTriggerUp: #removeIssue with: anIssue.
	anIssue triggerEvent: #removeComponent with: self.
	(anIssue isActive and: [self activeIssues isEmpty]) ifTrue: [
		self triggerHasActiveIssues: false].
	
	^anIssue
