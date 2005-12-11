accessing
addParent: trikeComponent 
	"Add trikeComponent as my new parent."
	super addParent: trikeComponent.
	self
		when: #rule
		send: #triggerEvent:
		to: trikeComponent
		with: #rule