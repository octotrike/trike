initialization
initializeConnections
	"Reset my connections collection."
	(connections notNil
			and: [connections notEmpty])
		ifTrue: [connections
				do: [:connection | self removeConnection: connection]].
	connections := IdentitySet new