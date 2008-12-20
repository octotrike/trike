accessing
add: aComponent
	"Add a Component I pertain to."
	
	(components includes: aComponent) ifTrue: [
		"aComponent is already one of my components."
		^nil].
	
	self noBalanceAdd: aComponent.
	aComponent noBalanceAddIssue: self.
	
	(isActive and: [aComponent activeIssues size = 1]) ifTrue: [
		aComponent triggerHasActiveIssues: true].
	aComponent passTriggerUp: #addIssue with: self.
	self triggerEvent: #addComponent with: aComponent.
	
	^aComponent
			