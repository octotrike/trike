accessing
removeActor: anActor 
	"Remove all references to anActor (which should all be not
	rules at this point), because anActor is being removed from
	my model."
	^ anActor = actor
		ifTrue: [not
				ifFalse: [self error: 'No positive actor rules should remain'].
			nil]
		ifFalse: [self]