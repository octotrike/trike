accessing
actions
	"Answer my intended actions."
	| result |
	result := OrderedCollection new.
	self assets do: [:asset | 
			asset inScope ifTrue: [
				asset actions do: [:action | result add: action]]].
	^ result