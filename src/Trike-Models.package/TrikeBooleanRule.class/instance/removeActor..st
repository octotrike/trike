accessing
removeActor: anActor 
	"Remove all references to anActor (which should all be not rules at this point), because anActor is being removed from my model."
	children copy do: [:child | | newChild |
		newChild := child removeActor: anActor.
		newChild 
			ifNil: [self removeRule: child]
			ifNotNil: [
				child = newChild 
					ifFalse: [
						self replaceRule: child with: newChild]]].
	children ifEmpty: [^nil].
	children size = 1 ifTrue: [^children only].
	^self