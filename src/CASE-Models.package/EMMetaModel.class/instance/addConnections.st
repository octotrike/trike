initialization
addConnections
	"Add connections for the entities representing each of my root classes and all their subclasses."
	
	self rootClasses do: [:rootClass | 
		rootClass addConnectionsTo: self.
		rootClass allSubclassesDo: [:subclass | subclass addConnectionsTo: self]].