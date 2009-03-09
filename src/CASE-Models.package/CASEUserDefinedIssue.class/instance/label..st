accessing
label: aString 
	label = aString ifFalse: [
		self session commit: [label := aString]]
