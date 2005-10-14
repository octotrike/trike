accessing
applyRuleToAllActors
	"Without changing the rules for any actor, mark all actors as known.  Send this message when you know the rules are complete for this action."
	
	knownActors addAll: model actors.
	self changed: #rule