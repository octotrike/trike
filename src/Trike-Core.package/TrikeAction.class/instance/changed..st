event handling
changed: anAspect
	"AnAspect of me has changed.  Notify my dependents accordingly."

	(#(#noAttack #anAttack) includes: anAspect) ifTrue: [
		model changed: anAspect with: self].
	super changed: anAspect