accessing
addActorNamed: aString 
	"Create a new actor named aString."
	(aString = TrikeActor newComponentString or: [aString = ''])
		ifFalse: [^ self
				addActor: (TrikeActor named: aString in: self)]