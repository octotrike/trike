accessing
currentState: possibilitySymbol 
	"Set my current state to possibilitySymbol."
	(colors keys includes: possibilitySymbol)
		ifFalse: [possibilitySymbol
				ifNotNil: [self error: 'No such state']].
	action setRulesForActor: parameter to: possibilitySymbol