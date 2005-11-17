event handling
registerForActionEvents
	"Register for events from my action."
	action ifNotNil: [
		action
			when: #rule send: #currentStateChanged to: self]