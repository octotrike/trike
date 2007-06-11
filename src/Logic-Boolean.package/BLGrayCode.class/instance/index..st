accessing
index: aString 
	"Set my index. aString should be the same length as
	truthTable's atomicTerms and contain only the characters $0,
	$1, and $?."
	aString size = truthTable atomicTerms size
		ifFalse: [self error: 'Index must be same size as atomicTerms'].
	index := aString