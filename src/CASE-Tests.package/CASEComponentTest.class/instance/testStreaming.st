running
testStreaming
	| i q |
	i := self targetClass labeled: 'cog'.
	q := self parentClass labeled: 'system'.

	self should: [i asString = 'a CASEComponent(cog)'].
	q addComponent: i.
	self should: [i asString = 'a CASEComponent(cog in system)'].
	q addImplementation: i.
	self should: [i asString = 'a CASEComponent(cog of system)'].