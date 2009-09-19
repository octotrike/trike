accessing
risk: aNumber 
	"Set the maximum risk posed by a human in this role. Larger  
	numbers are riskier."

	| result |
	result := aNumber asInteger.
	result ifNotNil: [(result >= 1 and: [result <= 5]) ifFalse: [^false]].
	risk := result.
	self triggerEvent: #risk.
	^true