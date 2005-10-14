event handling
close: evt
	
	"Do we need to save the current assessment?"
	model isDirty ifTrue: [
		self save: evt].

	owner removePage: self
	
	
	