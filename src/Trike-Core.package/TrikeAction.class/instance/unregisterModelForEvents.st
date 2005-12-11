event handling
unregisterModelForEvents
	"Unregister my model for events from me."
	model
		ifNotNil: [self 
			removeActionsWithReceiver: model forEvent: #rule;
			removeActionsWithReceiver: model forEvent: #attacks]