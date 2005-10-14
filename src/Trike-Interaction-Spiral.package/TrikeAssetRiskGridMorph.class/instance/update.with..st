event handling
update: anAspect with: aParameter 
	"AnAspect of an object I depend on has changed. Update  
	myself accordingly."
	self halt.
	super update: anAspect with: aParameter