accessing
name: aString 
	"Set my name to aString."
	aString = ''
		ifFalse: [name := aString].
	self triggerEvent: #name