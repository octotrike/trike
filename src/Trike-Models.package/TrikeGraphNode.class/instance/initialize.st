initialization
initialize
	"Set my initial state."
	super initialize.
	children := OrderedCollection new.
	parents := WeakIdentitySet new