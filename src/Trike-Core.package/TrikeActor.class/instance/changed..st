event handling
changed: anAspect
	"AnAspect of me has changed.  Update my dependents accordingly."

	(#(#name #risk) includes: anAspect) ifTrue: [
		model changed: #actors].
	super changed: anAspect