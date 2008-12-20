accessing
newMorphFor: anObject 
	"Answer the primary morph appropriate to display anObject."
	
	| morph x y |
	x := layoutBox left + (random next * layoutBox width).
	y := layoutBox top + (random next * layoutBox height).
	morph := (ModelToMorph at: anObject class) on: anObject.
	morph center: x@y.
	^morph