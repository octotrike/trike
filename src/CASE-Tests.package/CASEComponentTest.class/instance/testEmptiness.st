running
testEmptiness
	| i j q |
	i := self targetClass labeled: 'cog'.
	j := self targetClass labeled: 'alternative'.
	q := self parentClass labeled: 'system'.

	"When a component is first created, it should be empty."
	self should: [q isEmpty].
	
	"A component should still be empty after an implementation is added."
	q add: j as: #implementation.
	self should: [q isEmpty].
		
	"After a subcomponent is added, a component should no longer be empty."
	q add: i as: #subcomponent.
	self should: [q notEmpty].
