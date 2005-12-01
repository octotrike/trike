event handling
neverAllowAction
	^ GenericAction
		label: 'disallow ' , self label
		receiver: self
		selector: #neverAllow
		arguments: #()