accessing
label: aString
	"Set the label I believe all my components share, or are about to share."
	
	label = aString ifFalse: [
		label ifNotNil: [self error: 'duplicate label cannot be reset after initialization'].
		self session commit: [label := aString]]