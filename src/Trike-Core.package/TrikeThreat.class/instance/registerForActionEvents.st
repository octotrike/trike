event handling
registerForActionEvents
	"Register for events from my action."
	action
		ifNotNil: [
			action
				when: #model send: #modelChanged to: self;
				when: #name send: #triggerEvent: to: self with: #name;
				when: #rule send: #ruleChanged to: self;
				when: #value send: #triggerEvent: to: self with: #exposure]