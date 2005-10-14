event handling
update: anAspect 
	"My asset has changed. Does it pertain to me?"
	| parameterToPassOn |
	parameterToPassOn := anAspect.
	parameterToPassOn = #rule
		ifTrue: [parameterToPassOn := #currentState].
	super update: parameterToPassOn