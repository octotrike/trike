event handling
clauseEditingAction
	"Answer a GenericAction for editing my clause.  This is relevant only if I have a derived/constrained clause."
	^GenericActions
		label: 'change actor to'
		receiver: self
		selector: #clauseEditingActions
		arguments: #()