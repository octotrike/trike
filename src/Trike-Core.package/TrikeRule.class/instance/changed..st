event handling
changed: aParameter
	"Pass changes in my rule on to my parent."

	super changed: aParameter.
	aParameter = #rule ifTrue: [
		parents do: [:parent | parent changed: aParameter]]