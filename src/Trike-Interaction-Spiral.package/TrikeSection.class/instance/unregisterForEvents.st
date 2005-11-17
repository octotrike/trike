event handling
unregisterForEvents
	"Unregister for events from my model."
	(model notNil and: [self modelContentsSelector notNil])
		ifTrue: [model removeActionsWithReceiver: self forEvent: self modelContentsSelector]