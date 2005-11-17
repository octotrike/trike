accessing
addParent: trikeComponent 
	"Add trikeComponent as my new parent."
	parents add: trikeComponent.
	self
		when: #rule
		send: #triggerEvent:
		to: trikeComponent
		with: #rule