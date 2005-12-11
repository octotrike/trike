event handling
unlinkingFromAction: parent
	^ GenericAction
		label: 'unlink identical rules'
		receiver: self
		selector: #unlinkFrom:
		arguments: {parent}