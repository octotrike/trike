event handling
unlinkingFromAction: parent 
	^ parents size > 1
		ifTrue: [GenericAction
				label: 'Unlink Identical Rules'
				receiver: self
				selector: #unlinkFrom:
				arguments: {parent}]