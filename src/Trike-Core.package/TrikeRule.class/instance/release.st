initialization
release
	"Remove references to objects that may refer to me."
	
	super release.
	self 
		removeActionsWithReceiver: self forEvent: #name;
		removeActionsWithReceiver: self forEvent: #not;
		removeActionsWithReceiver: self forEvent: #knownActor: