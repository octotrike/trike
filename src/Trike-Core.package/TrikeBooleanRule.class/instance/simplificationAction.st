event handling
simplificationAction
	"If all of my parents (if any) are topLevel, answer an action to simplify me."
	^(parents detect: [:parent | parent topLevel not] ifNone: [nil])
		ifNil: [GenericAction
				label: 'Simplify Selected Rule'
				receiver: self
				selector: #simplify
				arguments: #()]
		ifNotNil: [nil]