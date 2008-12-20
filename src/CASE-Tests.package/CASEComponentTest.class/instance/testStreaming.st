running
testStreaming
	| i q |
	i := self targetClass labeled: 'cog'.
	q := self parentClass labeled: 'system'.

	self should: [i asString = 'a CASEComponent(cog)'].
	q add: i as: #subcomponent.
	self should: [i asString = 'a CASEComponent(cog in system)'].
	q add: i as: #implementation.
	self should: [i asString = 'a CASEComponent(cog of system)'].