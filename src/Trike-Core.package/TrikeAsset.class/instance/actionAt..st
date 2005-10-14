accessing
actionAt: actionSymbol 
	"Answer the Action for the given actionSymbol on me, or nil if there is none."
	^actions
		detect: [:action | action action = actionSymbol]
		ifNone: [nil]