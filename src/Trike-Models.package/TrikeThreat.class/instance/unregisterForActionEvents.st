event handling
unregisterForActionEvents
	"Unregister for events from my action."
	action
		ifNotNil: [
			action
				removeActionsWithReceiver: self forEvent: #model;
				removeActionsWithReceiver: self forEvent: #name;
				removeActionsWithReceiver: self forEvent: #rule;
				removeActionsWithReceiver: self forEvent: #value]