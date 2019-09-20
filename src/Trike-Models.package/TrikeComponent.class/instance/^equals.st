testing
= anObject 
	^ (self class = anObject class
		and: [self privateModel = anObject privateModel])
		and: [self name = anObject name]