event handling
addRuleAction
	^ GenericActions
		label: (rule
				ifNil: ['Only']
				ifNotNil: ['Also'])
				, ' Allow ' , self label , ' When'
		receiver: self baseNodeClass
		selector: #addNodesAction:
		arguments: {self}