accessing
allowImplicitDelete
	"Allow myself to be deleted implicitly."

	self session commit: [
		implicitDeleteIsAllowed := true]