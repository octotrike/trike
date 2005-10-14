instance creation
disallowFor: anActor 
	"Previously, this action was allowed for every actor in this 
	situation, therefore it should still be allowed for other actors in this 
	situation."
	| noActor |
	noActor := TrikeActorRule actor: anActor.
	noActor not: true.
	^ self /\ noActor