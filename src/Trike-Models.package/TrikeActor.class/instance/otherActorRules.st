accessing
otherActorRules
	"Answer a rule which allows every other actor in my model, but not  
	me."
	| otherActorRules |
	otherActorRules := (model actors copyWithout: self)
				collect: [:actor | TrikeActorRule actor: actor].
	^ otherActorRules
		ifEmpty: [nil]
		ifNotEmpty: [TrikeOrRule withChildren: otherActorRules]