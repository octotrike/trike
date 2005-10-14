testing
= anObject 
	^ self class = anObject class
		and: [self id = anObject id]