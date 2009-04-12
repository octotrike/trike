accessing
abort
	"Abort my transaction."
	
	session ifNotNil: [
		self session abort]