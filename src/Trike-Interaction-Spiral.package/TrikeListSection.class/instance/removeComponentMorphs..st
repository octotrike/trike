initialization
removeComponentMorphs: aComponent
	"Remove the row of morphs associated with aComponent."
	| componentRow listSubmorphs listLayout morphsToDelete |
	
	"Find the correct row."
	listSubmorphs := listMorph submorphs.
	listLayout := listMorph layoutPolicy.
	componentRow := (2 to: (listMorph rowCount - 1)) detect: [:row |
		(listSubmorphs at: (listLayout indexFromGridSquare: 1@row horizontal: true)) target = aComponent].
	
	"Find morphs in that row."
	morphsToDelete := (1 to: listMorph columnCount) collect: [:column |
		listSubmorphs at: (listLayout indexFromGridSquare: column@componentRow horizontal: true)].
	listMorph removeAllMorphsIn: morphsToDelete.
	listMorph rowCount: listMorph rowCount - 1