event handling
clauseEditingAction
	"Answer a GenericAction for editing my clause."
	^ GenericAction
		label: 'Change OR to AND'
		receiver: self
		selector: #becomeAnd
		arguments: #()