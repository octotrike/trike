running
testUndoByAborting
	| i a iSpy |
	i := self componentClass labeled: 'cog'.
	iSpy := self spyOn: i.
	self addAll: {i}.
	
	self targetClass on: CASEAboutToCreateInstance send: #signal to: CASEAbortTransaction.
	self remember: CASEAbortTransaction listensTo: self targetClass.
	self should: [a := self targetClass on: {i}] raise: CASEAbortTransaction.	
	a abortWouldUndo ifTrue: [
		self should: [a isActive].
		a abort.
		self shouldnt: [a isActive]]
