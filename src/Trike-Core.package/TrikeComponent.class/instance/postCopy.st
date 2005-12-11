copying
postCopy
	"Reset my id."

	super postCopy.
	self registerForSelfEvents.
	id := UUID new