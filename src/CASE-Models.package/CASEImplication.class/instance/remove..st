accessing
remove: aComponent
	"Remove a Component I no longer pertain to."
	
	(components includes: aComponent) ifFalse: [
		"aComponent is not one of my components."
		^nil].
	
	self noBalanceRemove: aComponent.
	aComponent noBalanceRemoveImplication: self.
	
	aComponent passTriggerUp: #removeIssue with: self.
	self triggerEvent: #removeComponent with: aComponent.
	(isActive and: [aComponent hasActiveIssues not]) ifTrue: [
		aComponent triggerHasActiveIssues: false].
	
	^aComponent
			