accessing
concreteSubclasses
	^(self allSubclasses reject: [:c | c isAbstract])
		asSortedCollection: [:c1 :c2 | c1 label <= c2  label]