event handling
addRuleAction: parent
	"Answer a GenericAction for adding an instance of me to the given parent."
	
	^GenericActions
		label: self label
		receiver: self
		selector: #addRuleToActions:
		arguments: {parent}