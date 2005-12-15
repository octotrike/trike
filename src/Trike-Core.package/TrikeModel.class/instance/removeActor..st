accessing
removeActor: actor
	"Remove actor from the Collection of actors stakeholders in this system care about."

	self triggerEvent: actor class removeSymbol  with: actor.
	self intendedActions do: [:action |
		action removeActor: actor].
	actors remove: actor.