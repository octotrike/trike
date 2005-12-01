event handling
addRuleToActions: parent
	"Answer a GenericAction for adding an instance of me to the given parent."
	^parent model actors collect: [:actor | 
		GenericAction
			label: actor name
			receiver: self
			selector: #addRuleTo:withConstraint:
			arguments: {parent. actor}]
		