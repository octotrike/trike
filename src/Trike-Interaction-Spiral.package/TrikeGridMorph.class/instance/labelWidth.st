accessing
labelWidth
	"Answer the width, in pixels, of a row or column label given the 
	current value of labelFont."
	labelWidth
		ifNil: [self computeLabelSize].
	^ labelWidth