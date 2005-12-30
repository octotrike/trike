accessing
rulesForActor: anActor

	^(knownActors includes: anActor) 
		ifTrue: [
			intended 
				ifTrue: [
					rule
						ifNil: [#always]
						ifNotNil: [ | result |
							result := rule selectForActor: anActor.
							(#(#always #never) includes: result)
								ifTrue: [result]
								ifFalse: [#sometimes]]]
				ifFalse: [#never]]
		ifFalse: [
			asset inScope 
				ifTrue: [#unknown]
				ifFalse: [#sometimes]]
