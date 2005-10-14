accessing
findColumnForComponent: component 
	"Answer the column number associated with the given 
	TrikeComponent. "
	submorphs
		do: [:submorph | submorph model = component
				ifTrue: [| linearIndex | 
					linearIndex := self submorphIndexOf: submorph.
					^ (self layoutPolicy gridSquareFromIndex: linearIndex horizontal: true) x]].
	^0