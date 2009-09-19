accessing
setUnknownTo: possibilitySymbol
	"Fix up my rule and knownActors such that the given  
	possibilitySymbol is answered for any queries which
	currently answer unknown."

	model actors do: [:anActor |
		(knownActors includes: anActor) ifFalse: [
			self setRulesForActor: anActor to: possibilitySymbol]]