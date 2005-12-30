event handling
gridMenuEvent: anEvent over: submorph 
	anEvent yellowButtonPressed
		ifTrue: [self gridMenu popUpEvent: anEvent in: submorph world]