event handling
addRuleAction: parent
	"Answer a GenericAction for adding an instance of me to the given parent."
	
	^GenericAction 
		label: self label
		receiver: self
		selector: #addRuleTo:
		arguments: {parent}