event handling
unregisterForEvents
	"Unregister for events from my model."
	super unregisterForEvents.
	model ifNil: [^self].
	self componentAddSymbol
		ifNotNil: [model removeActionsWithReceiver: self forEvent: self componentAddSymbol].
	self componentRemoveSymbol
		ifNotNil: [model removeActionsWithReceiver: self forEvent: self componentRemoveSymbol].
		