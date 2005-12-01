event handling
addRuleAction
	^ GenericActions
		label: (rule
				ifNil: ['only']
				ifNotNil: ['also'])
				, ' allow ' , self label , ' when'
		receiver: TrikeRule
		selector: #addRulesAction:
		arguments: {self}