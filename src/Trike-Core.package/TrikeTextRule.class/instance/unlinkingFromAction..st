event handling
unlinkingFromAction: parent
	^parents size > 1
		ifTrue: [GenericAction
			label: 'unlink identical rules'
			receiver: self
			selector: #unlinkFrom:
			arguments: {parent}]
		ifFalse: [nil]