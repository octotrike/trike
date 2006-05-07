accessing
description: aString
	"Set my description."

	description := aString.
	self triggerEvent: #description: with: description