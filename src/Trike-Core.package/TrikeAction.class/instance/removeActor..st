accessing
removeActor: anActor 
	"Update myself to delete all references to anActor, because
	anActor is being deleted from my model."
	knownActors remove: anActor ifAbsent: [].
	rule
		ifNotNil: [self disallowFor: anActor].
	rule
		ifNotNil: [self
				rule: (rule removeActor: anActor)]