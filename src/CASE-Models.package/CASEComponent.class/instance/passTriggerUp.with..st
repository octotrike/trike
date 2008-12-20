event handling
passTriggerUp: aSymbol with: anObject
	"I, or one of my subcomponents, just had something happen which both I and my parent need to know.  Notify those who need to know."
	
	self triggerEvent: aSymbol with: anObject.
	self isTop ifFalse: [ 
		parent passTriggerUp: aSymbol with: anObject]