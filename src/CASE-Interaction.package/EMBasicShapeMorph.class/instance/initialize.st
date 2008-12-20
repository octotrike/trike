initialization
initialize
	"Set my initial state."
	
	super initialize.
	self addText: ''.
	self width: 100.
	self layoutChanged; fullBounds.
	self stopStepping