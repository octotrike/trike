instance creation
disallowFor: anActor 
	"Previously, this action was allowed for every actor in this 
	situation, therefore it should still be allowed for other actors in this 
	situation."
	| noActor result |
	noActor := TrikeActorRule actor: anActor.
	noActor not: true.
	result := self /\ noActor.
	^ result isSymbol ifTrue: [nil] ifFalse: [result]