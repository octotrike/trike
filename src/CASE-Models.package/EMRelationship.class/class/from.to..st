instance creation
from: subject to: object
	"Answer a new instance of me representing a directional relationship between subject and object."
	
	^(self new)
		subject: subject;
		object: object;
		yourself