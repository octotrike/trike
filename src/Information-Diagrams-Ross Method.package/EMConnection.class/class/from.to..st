instance creation
from: startObject to: end 
	"Answer a new instance of me representing an appropriate
	connection from start to end. Start should be an
	EMObject; the appropriate type of end depends on
	my subclass."
	self subclassResponsibility