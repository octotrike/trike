actions
evaluationAction
	"Answer a GenericAction for evaluating me."
	^ GenericAction
		label: 'Evaluate Selected ', self label
		receiver: self
		selector: #evaluate
		arguments: #()