construction
removeColumn: aComponent 
	"Remove the column of morphs associated with aComponent."
	| layout componentColumn morphsToDelete |
	
	"Find the correct column."
	layout := self layoutPolicy.
	componentColumn := (2 to: self columnCount) detect: [:column |
		(submorphs at: (layout indexFromGridSquare: column@1 horizontal: true)) submorphs only target = aComponent].
	
	"Find morphs in that column."
	morphsToDelete := (1 to: self rowCount) collect: [:row |
		submorphs at: (layout indexFromGridSquare: componentColumn@row horizontal: true)].
	self removeAllMorphsIn: morphsToDelete.
	self columnCount: self columnCount - 1.