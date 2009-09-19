initialization
initialize
	"Set my initial state."
	super initialize.
	inScope := true.
	actions := self possibleActions collect: [:actionSymbol |
		TrikeAction action: actionSymbol onAsset: self when: nil]