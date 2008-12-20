event handling
triggerHasActiveIssues: aBoolean
	"The state of hasActiveIssues just changed.  Notify those who need to know."
	
	self triggerEvent: #hasActiveIssues with: aBoolean.
	self isTop ifFalse: [ | parentalIssueCount |
		parentalIssueCount := parent activeIssues size.
		((aBoolean and: [parentalIssueCount = 1]) or: 
		[aBoolean not and: [parentalIssueCount = 0]]) 
			ifTrue: [parent triggerHasActiveIssues: aBoolean]]