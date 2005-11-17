accessing
removeParent: trikeComponent 
	"Remove trikeComponent from my parents list."
	parents remove: trikeComponent.
	self removeActionsWithReceiver: trikeComponent forEvent: #rule