event handling
changed: anAspect
	"AnAspect of me has changed.  Update my dependents accordingly."

	anAspect = #riskFactor ifTrue: [
		self changed: #exposure].
	anAspect = #exposure ifTrue: [
		self changed: #risk].
	(#(#name #risk #action) includes: anAspect) ifTrue: [
		model changed: #attacks].
	super changed: anAspect