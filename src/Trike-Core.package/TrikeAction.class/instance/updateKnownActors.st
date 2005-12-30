accessing
updateKnownActors
	"Without changing the rules for any actor, mark all actors
	which are explicitly mentioned in the rules as known."
	knownActors addAll: rule knownActors.