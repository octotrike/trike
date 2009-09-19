accessing
actions
	"Answer all possible actions, intended or not."
	| result |
	result := OrderedCollection new.
	self assets do: [:asset | 
			asset inScope ifTrue: [
				asset actions do: [:action | result add: action]]].
	^ result