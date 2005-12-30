accessing
addParent: trikeComponent 
	"Add trikeComponent as my new parent."
	super addParent: trikeComponent.
	trikeComponent triggerEvent: #knownActor: with: actor