accessing
actions
	"Answer my intended actions."
	| result |
	result := OrderedCollection new.
	self assets asSortedCollection
		do: [:asset | 
			asset inScope ifTrue: [
				asset actions asSortedCollection
					do: [:action | result add: action]]].
	^ result