event handling
simplificationAction
	^ GenericAction
		label: 'simplify selected rule'
		receiver: self
		selector: #simplify
		arguments: #()