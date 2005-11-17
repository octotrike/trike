accessing
addParent: trikeComponent 
	"Add trikeComponent as my new parent."
	super addParent: trikeComponent.
	self triggerEvent: #knownActor: with: actor