event handling
simplificationAction
	^ GenericAction
		label: 'Simplify Selected Rule'
		receiver: self
		selector: #simplify
		arguments: #()