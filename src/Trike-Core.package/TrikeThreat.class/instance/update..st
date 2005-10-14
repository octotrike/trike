event handling
update: anAspect
	"AnAspect of my asset has changed.  Update my dependents accordingly."

	anAspect = #name ifTrue: [
		self changed: #name].
	anAspect = #value ifTrue: [
		self changed: #exposure]