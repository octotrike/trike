accessing
subclassesWantingNewInstances
	^(self allSubclasses select: [:c | c wantsNewInstances])
		asSortedCollection: [:c1 :c2 | c1 label <= c2  label]