event handling
addRuleActionNamed: aSymbol 
	^ GenericActions
		label: 'add ' , aSymbol asString , ' rule'
		receiver: TrikeRule
		selector: #addRulesAction:
		arguments: {self}