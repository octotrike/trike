accessing
rulesForActor: anActor 
	^ (knownActors includes: anActor)
		ifTrue: [intended
				ifTrue: [rule
						ifNil: [#Always]
						ifNotNil: [| result | 
							result := rule selectForActor: anActor.
							(#(#Always #Never ) includes: result)
								ifTrue: [result]
								ifFalse: [#Sometimes]]]
				ifFalse: [#Never]]
		ifFalse: [asset inScope
				ifTrue: [#Unknown]
				ifFalse: [#Sometimes]]