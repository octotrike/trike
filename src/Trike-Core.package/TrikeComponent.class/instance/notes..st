accessing
notes: aStringOrText 
	"Set my notes."
	notes := aStringOrText asString.
	self triggerEvent: #notes.
	^ true