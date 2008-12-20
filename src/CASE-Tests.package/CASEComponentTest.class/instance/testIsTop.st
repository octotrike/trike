running
testIsTop
	| i j q |
	i := self targetClass labeled: 'cog'.
	j := self targetClass labeled: 'alternative'.
	q := self parentClass labeled: 'system'.
	q add: j as: #implementation.
	q add: i as: #subcomponent.

	"A component with no parent is a top component."
	self should: [q isTop].
	
	"A component which is a subcomponent is not a top component, unless it has a different modelType from its parent."
	q modelType = i modelType 
		ifTrue: [self shouldnt: [i isTop]]
		ifFalse: [self should: [i isTop]].
	
	"A component which is an implementation is a top component."
	self should: [j isTop].