initalization
on: aURI
	"Create a session on the given URI and set my initial state,"
	
	session := (MagmaSession openLocal: aURI) needsWork.
	self connect.
	session root ifNil: [
		session root: self newRoot].
	reannouncementQueue := OrderedCollection new.
	
	
	