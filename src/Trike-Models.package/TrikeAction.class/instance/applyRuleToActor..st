accessing
applyRuleToActor: anActor
	"Without changing the rules for this actor, mark it as 
	known. This message is usually sent when a rule involving
	this actor is added using some interface other than
	setRulesForActor:to: (e.g. the tree view)."
	knownActors add: anActor.
	self triggerEvent: #rule