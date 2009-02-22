event handling
shouldPassUpHasActiveIssuesChanges: aBoolean
	"The state of hasActiveIssues just changed, or is about to.  Answer whether I need to notify my parent."
	| parentalIssueCount |
	
	parentalIssueCount := parent activeIssues size.
	^((aBoolean and: [parentalIssueCount = 1]) or: [aBoolean not and: [parentalIssueCount = 0]]) 

	