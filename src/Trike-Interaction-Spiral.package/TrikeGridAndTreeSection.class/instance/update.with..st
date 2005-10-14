event handling
update: anAspect with: aParameter
	"AnAspect of my model has changed. Update myself  
	accordingly."
	(grid interestingAspects includes: anAspect)
		ifTrue: [
			grid update: anAspect with: aParameter].
	super update: anAspect with: aParameter