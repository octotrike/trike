accessing
label: aString
	"Set the label I believe all my components share, or are about to share."
	
	label ifNotNil: [self error: 'duplicate label cannot be reset after initialization'].
	label := aString