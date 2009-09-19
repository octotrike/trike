accessing
knownActors
	"Answer a Collection of actors which explicitly appear in this rule."

	| result |
	result := Set new.
	children do: [:child |
		result addAll: child knownActors].
	^result