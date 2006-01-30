accessing
selectForActor: anActor 
	"Answer #always, #never, or a rule that is equivalent to me
	when an 
	actor is anActor."
	^ not
		ifTrue: [actor = anActor
				ifTrue: [#Never]
				ifFalse: [#Always]]
		ifFalse: [actor = anActor
				ifTrue: [#Always]
				ifFalse: [#Never]]