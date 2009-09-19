event handling
passUpKnownActor: anActor
	"Notify my parents that anActor is now known."

	parents do: [:parent | parent triggerEvent: #knownActor: with: anActor]