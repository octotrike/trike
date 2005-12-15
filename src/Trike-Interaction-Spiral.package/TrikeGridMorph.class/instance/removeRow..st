construction
removeRow: aComponent 
	"Remove the row of morphs associated with aComponent."
	| layout componentRow morphsToDelete |
	
	"Find the correct row."
	layout := self layoutPolicy.
	componentRow := (2 to: self rowCount) detect: [:row |
		(submorphs at: (layout indexFromGridSquare: 1@row horizontal: true)) target = aComponent].
	
	"Find morphs in that row."
	morphsToDelete := (1 to: self columnCount) collect: [:column |
		submorphs at: (layout indexFromGridSquare: column@componentRow horizontal: true)].
	self removeAllMorphsIn: morphsToDelete.
	self rowCount: self rowCount - 1.