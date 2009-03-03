event handling
mightChangeActiveIssuesFor: aComponent becauseOf: anImplication with: aSymbol
	"If adding or removing anImplication causes hasActiveIssues to change, trigger an event on me, then hand up to my parent." 

	anImplication isIssue ifTrue: [ | activeIssues eventArguments |
		activeIssues := self activeIssues.
		([activeIssues size = 1] and: [activeIssues includes: anImplication]) ifTrue: [
			eventArguments := {self. true}].
		([activeIssues size = 0] and: [anImplication isActive or: ['*IsActive' match: aSymbol]]) ifTrue: [
			eventArguments := {self. true}].
		eventArguments ifNotNil: [ | eventToTrigger |
			eventToTrigger := (aSymbol beginsWith: #aboutTo) 
				ifTrue: [#aboutToChangeHasActiveIssues]
				ifFalse: [#changedHasActiveIssues].
			self triggerEvent: eventToTrigger withArguments: eventArguments.
			parent ifNotNil: [
				parent mightChangeActiveIssuesFor: aComponent becauseOf: anImplication with: aSymbol]]]
