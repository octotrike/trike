event handling
ruleChanged
	"My action's rule has changed.  Do I need to update my name?"

	action rule isNil = ruleIsNil ifTrue: [^self].
	ruleIsNil := action rule isNil.
	self triggerEvent: #name