accessing
notes: aStringOrText 
	"Set my notes."
	notes := aStringOrText asString.
	self changed: #notes.
	^ true