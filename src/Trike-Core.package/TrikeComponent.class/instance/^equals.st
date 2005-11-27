testing
= anObject 
	^ self class = anObject class
		and: [self model = anObject model]
		and: [self name = anObject name]