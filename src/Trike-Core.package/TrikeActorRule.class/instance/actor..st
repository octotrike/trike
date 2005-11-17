accessing
actor: anActor
	"Set my actor."
	actor ifNotNil: [actor removeActionsWithReceiver: self forEvent: #name].
	actor := anActor.
	actor ifNotNil: [actor when: #name send: #triggerEvent: to: self with: #name].
	self 
		triggerEvent: #knownActor: with: actor;
		triggerEvent: #name.