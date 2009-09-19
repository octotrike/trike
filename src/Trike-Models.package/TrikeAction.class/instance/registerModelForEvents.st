event handling
registerModelForEvents
	"Register my model for events from me."
	model
		ifNotNil: [self
				when: #rule
				send: #triggerEvent:
				to: model
				with: #intendedActions;
				
				when: #attacks
				send: #triggerEvent:
				to: model
				with: #attacks]