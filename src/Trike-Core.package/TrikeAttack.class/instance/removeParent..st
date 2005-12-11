accessing
removeParent: trikeComponent 
	"Remove trikeComponent from my parents list."
	super removeParent: trikeComponent.
	self removeActionsWithReceiver: trikeComponent forEvent: #attacks