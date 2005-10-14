accessing
selectForActor: anActor 
	"Answer #always, #never, or a rule that is equivalent to me when an  
	actor is anActor."
	^ not
		ifTrue: [(actor = anActor)
			ifTrue: [#never]
			ifFalse: [#always]]
		ifFalse: [(actor = anActor)
			ifTrue: [#always]
			ifFalse: [#never]]