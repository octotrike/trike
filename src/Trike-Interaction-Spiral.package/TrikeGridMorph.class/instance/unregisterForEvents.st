event handling
unregisterForEvents
	"Unregister for events from my model."
	
	model ifNil: [^self].
	model
		removeActionsWithReceiver: self forEvent: self rowAddSymbol;
		removeActionsWithReceiver: self forEvent: self rowRemoveSymbol.
	self columnAddSymbol ifNotNil: [
		model removeActionsWithReceiver: self forEvent: self columnAddSymbol].
	self columnRemoveSymbol ifNotNil: [
		model removeActionsWithReceiver: self forEvent: self columnRemoveSymbol].
		
	