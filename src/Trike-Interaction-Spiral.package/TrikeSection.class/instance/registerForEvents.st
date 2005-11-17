event handling
registerForEvents
	"Register for events from my model."
	(model notNil and: [self modelContentsSelector notNil])
		ifTrue: [model when: self modelContentsSelector send: #contentsChanged to: self]