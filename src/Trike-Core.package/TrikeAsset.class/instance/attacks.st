accessing
attacks
	"Answer the current set of attacks against me."
	| result |
	result := Set new.
	actions
		do: [:action | result
				addAll: action attacks].
	^ result