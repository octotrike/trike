accessing
components: aCollection
	"Set my Collection of Components."
	
	components ifNotEmpty: [self error: 'components cannot be reset after initialization'].
	aCollection ifNil: [
		"components is already empty; there's no need to do anything."
		^self].
	
	aCollection do: [:c |
		self noBalanceAdd: c.
		c noBalanceAddImplication: self].
	
	isActive ifTrue: [
		components do: [:c | (c activeIssues size = 1) ifTrue: [
			c triggerHasActiveIssues: true]]].
	components do: [:c |
		c passTriggerUp: #addIssue with: self.
		self triggerEvent: #addComponent with: c].
	