accessing
removeActor: actor
	"Remove actor from the Collection of actors stakeholders in this system care about."

	actors remove: actor.
	self changed: #noActor with: actor