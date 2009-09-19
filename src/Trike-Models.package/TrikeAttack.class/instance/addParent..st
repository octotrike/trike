accessing
addParent: trikeComponent 
	"Add trikeComponent as my new parent."
	super addParent: trikeComponent.
	self
		when: #attacks
		send: #triggerEvent:
		to: trikeComponent
		with: #attacks