copying
postCopy
	"Reset my id."

	super postCopy.
	id := UUID new