event handling
alwaysAllowAction
	^ GenericAction
		label: 'always allow ', self label
		receiver: self
		selector: #alwaysAllow
		arguments: #()