initialization
initializeObjects
	"Reset my objects collection."
	(objects notNil
			and: [objects notEmpty])
		ifTrue: [objects
				do: [:dataObject | self removeObject: dataObject]].
	objects := IdentitySet new.