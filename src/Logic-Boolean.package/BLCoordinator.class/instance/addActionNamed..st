actions
addActionNamed: aSymbol 
	^ self canHaveChildren
		ifTrue: [GenericActions
				label: 'Add ' , aSymbol asString , ' ', self label
				receiver: self baseClass
				selector: #addClausesAction:
				arguments: {self}]