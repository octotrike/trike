event handling
update: anAspect with: aParameter 
	"My asset has changed. Does it pertain to me?"
	((#(#anAction #noAction ) includes: anAspect)
			and: [aParameter action = actionSymbol])
		ifTrue: [
			self update: #currentState].
	super update: anAspect with: aParameter