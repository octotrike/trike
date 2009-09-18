instance creation
check: parent forDuplicatesLabeled: label in: namespace
	"If there are duplicates with the given label, create (or add to) an instance of myself and answer true. Otherwise, answer false."
	| duplicates |
	
	duplicates := (parent componentsIn: namespace) collect: [:c |
		c label = label].
	^(duplicates size >= 2) ifTrue: [self on: duplicates label: label in: namespace; needsWork. true]