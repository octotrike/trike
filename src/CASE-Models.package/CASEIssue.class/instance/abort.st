event handling
abort
	"Abort the change-in-progress that caused me, so that I will vanish."
	
	CASEAbortTransaction signal: 'Undo to resolve conflict' with: self