initialization
setDeterminants
	"Set determinants for the entities representing each of my root classes and all their subclasses."
	
	self rootClasses do: [:rootClass | 
		rootClass setDeterminantIn: self.
		rootClass allSubclassesDo: [:subclass | subclass setDeterminantIn: self]].