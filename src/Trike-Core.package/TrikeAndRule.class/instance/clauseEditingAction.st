event handling
clauseEditingAction
	"Answer a GenericAction for editing my clause."
	^ GenericAction
		label: 'Change AND to OR'
		receiver: self
		selector: #becomeOr
		arguments: #()