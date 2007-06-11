accessing
addParent: anObject

	parents add: anObject.
	self
		when: #clause
		send: #triggerEvent:
		to: anObject
		with: #clause
