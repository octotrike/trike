event handling
addRuleAction
	^ GenericActions
		label: (rule
				ifNil: ['only']
				ifNotNil: ['also'])
				, ' allow ' , self label , ' when'
		receiver: self baseNodeClass
		selector: #addNodesAction:
		arguments: {self}