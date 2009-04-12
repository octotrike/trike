event handling
undo
	"By default, undo should not be implemented unless it can be done via abort."
	
	self abortWouldUndo 
		ifTrue: [self abort]
		ifFalse: [self shouldNotImplement]