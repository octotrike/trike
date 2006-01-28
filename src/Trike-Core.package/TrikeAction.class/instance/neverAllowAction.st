event handling
neverAllowAction
	^ GenericAction
		label: 'Disallow ' , self label
		receiver: self
		selector: #neverAllow
		arguments: #()