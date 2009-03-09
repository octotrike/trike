accessing
requireExplicitDelete
	"Prevent myself from being implicitly deleted."

	self session commit: [
		implicitDeleteIsAllowed := false]