accessing
attacks
	"Answer my threats."
	| result |
	result := SortedCollection sortBlock: [:a :b | a exposureGreaterThan: b].
	self assets
		do: [:asset | result addAll: asset attacks].
	^ result