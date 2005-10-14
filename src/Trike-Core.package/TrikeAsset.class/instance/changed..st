event handling
changed: anAspect
	"AnAspect of me has changed.  Update my dependents accordingly."

	(#(#name #value) includes: anAspect) ifTrue: [
		model changed: #assets.
		model changed: #actions].
	(#(#inScope #model) includes: anAspect) ifTrue: [
		actions do: [:action |
			action update: anAspect]].
	super changed: anAspect
