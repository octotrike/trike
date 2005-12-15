construction
crudMorph: w
	"Answer a grid containing CRUD."
	| crud s result |
	s := w / 2.
	result := AlignmentMorph new.
	result beTransparent; changeGridLayout; changeListDirection: #leftToRight; hResizing: #shrinkWrap; vResizing: #shrinkWrap; cellPositioning: #topLeft; columnCount: 2; rowCount: nil.
	crud := OrderedCollection new.
	#('C' 'R' 'U' 'D' )
		do: [:letter | 
			| letterMorph | 
			letterMorph := TTSampleStringMorph font: self defaultFont.
			letterMorph color: Color black;
				 borderWidth: 0;
				 string: letter;
				 extent: s @ s.
			crud add: letterMorph].
	result addAllMorphs: crud.
	^result