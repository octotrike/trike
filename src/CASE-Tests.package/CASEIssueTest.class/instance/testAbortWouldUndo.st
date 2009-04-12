running
testAbortWouldUndo
	| i a iSpy |
	i := self componentClass labeled: 'cog'.
	iSpy := self spyOn: i.
	self addAll: {i}.
	
	self targetClass on: CASEAboutToCreateInstance send: #signalWith: to: CASEAbortTransaction.
	self remember: CASEAbortTransaction listensTo: self targetClass.
	a := [self targetClass on: {i}] on: CASEAbortTransaction do: [:ex |
		ex tag object].	
	self should: [a abortWouldUndo].
	self commit.
	self shouldnt: [a abortWouldUndo].	
