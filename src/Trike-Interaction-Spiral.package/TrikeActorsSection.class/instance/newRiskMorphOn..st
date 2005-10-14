initialization
newRiskMorphOn: anActor
	"Answer a new morph on the risk of anActor."
	| result |
	result := UpdatingStringMorph new.
	result useStringFormat; target: anActor; getSelector: #riskAsString; putSelector: #risk:; setBalloonText: 'Click to enter a new risk for this ' , self componentName.
	self needsWork. "Using riskAsString vs. risk means updating could be broken."
	^ result