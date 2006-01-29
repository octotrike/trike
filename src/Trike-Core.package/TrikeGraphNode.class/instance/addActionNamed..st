event handling
addActionNamed: aSymbol 
	^ self canHaveChildren
		ifTrue: [GenericActions
				label: 'Add ' , aSymbol asString , ' ' , self label
				receiver: self baseNodeClass
				selector: #addNodesAction:
				arguments: {self}]