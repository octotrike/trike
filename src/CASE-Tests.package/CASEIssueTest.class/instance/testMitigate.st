running
testMitigate
	| i a iSpy aSpy |
	i := self componentClass labeled: 'cog'.
	a := self targetClass on: {i}.
	iSpy := self spyOn: i.
	aSpy := self spyOn: a.
	self addAll: {i. a}.
	
	self shouldnt: [a mitigate] raise: Error.
	a defaultMitigation 
		ifNil: [self should: [a isActive]]
		ifNotNil: [self shouldnt: [a isActive]].

