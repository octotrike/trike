initialization
buildComponentMorphs: aComponent 
	"Add the last row of morphs before the componentCreator for aComponent."

	| row column |
	row := listMorph rowCount.
	listMorph rowCount: row + 1.
	column := 1.
	self columnConstructorSelectors do: 
			[:selector | 
			| morph |
			morph := self perform: selector with: aComponent.
			listMorph addMorph: morph
				asElementNumber: (listMorph layoutPolicy indexFromGridSquare: column @ row
						horizontal: true).
			column := column + 1]