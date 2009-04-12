running
testUndo
	| i a iSpy aSpy |
	i := self componentClass labeled: 'cog'.
	a := self targetClass on: {i}.
	iSpy := self spyOn: i.
	aSpy := self spyOn: a.
	self addAll: {i. a}.
	
	i isUndoable ifTrue: [
		a undo.
		self shouldnt: [a isActive]]
