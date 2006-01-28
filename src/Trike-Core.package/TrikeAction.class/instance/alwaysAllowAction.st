event handling
alwaysAllowAction
	^ GenericAction
		label: 'Always Allow ' , self label
		receiver: self
		selector: #alwaysAllow
		arguments: #()