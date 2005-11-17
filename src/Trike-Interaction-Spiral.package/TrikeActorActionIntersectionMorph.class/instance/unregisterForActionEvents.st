event handling
unregisterForActionEvents
	"Unregister for events from my action."
	action ifNotNil: [
		action
			removeActionsWithReceiver: self forEvent: #rule]