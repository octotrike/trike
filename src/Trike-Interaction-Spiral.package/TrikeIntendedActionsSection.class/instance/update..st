event handling
update: anAspect 
	"AnAspect of my model has changed. Update myself  
	accordingly."
	(#(#anAction #noAction #model #actions ) includes: anAspect)
		ifTrue: [self changed: #items].
	super update: anAspect