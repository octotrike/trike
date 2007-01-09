initialization
addEntities
	"Add entities for each of my root classes and all their subclasses."
	
	self rootClasses do: [:rootClass | 
		self addObject: rootClass entityType.
		rootClass allSubclassesDo: [:subclass | self addObject: subclass entityType]].