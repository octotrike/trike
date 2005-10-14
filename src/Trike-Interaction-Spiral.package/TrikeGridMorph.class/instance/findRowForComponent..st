accessing
findRowForComponent: component 
	"Answer the row number associated with the given 
	TrikeComponent. "
	1
		to: submorphs size
		do: [:linearIndex | (submorphs at: linearIndex) model = component
				ifTrue: [^ (self layoutPolicy gridSquareFromIndex: linearIndex horizontal: true) y]].
	^0