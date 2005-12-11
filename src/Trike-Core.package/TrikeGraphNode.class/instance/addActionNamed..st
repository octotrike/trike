event handling
addActionNamed: aSymbol 
	^self canHaveChildren
		ifTrue: [ GenericActions
			label: 'add ' , aSymbol asString , ' ' , self label
			receiver: self baseNodeClass
			selector: #addNodesAction:
			arguments: {self}]
		ifFalse: [nil]