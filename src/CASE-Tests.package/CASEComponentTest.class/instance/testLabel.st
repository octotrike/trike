running
testLabel
	| a b i iSpy |
	a := 'foo'.
	b := 'bar'.
	i := self targetClass labeled: a.
	iSpy := self spyOn: i.
	self add: i.
	
	"When an object is created with a label, it should have that label thereafter."
	self should: [i label = a].

	"When an object's label does not change, it should not trigger either AboutToChangeLabel or ChangedLabel."
	i label: a.
	self should: [iSpy announcements isEmpty].
	
	"When an object's label changes, it should trigger AboutToChangeLabel, then ChangedLabel and have the new label thereafter."
	i label: b.	
	self should: [iSpy announcements size = 2].
	self confirm: iSpy announcements first isKindOf: CASEAboutToChangeLabel of: i from: a to: b.
	self confirm: iSpy announcements second isKindOf: CASEChangedLabel of: i from: a to: b.
	self should: [i label = b].
	
	iSpy clear.
	
	"When changing an object's label is aborted in mid-change as the result of AboutToChangeLabel, AboutToChangeLabel should be triggered, but ChangedLabel should not, and the object should continue to have the old label."
	i on: CASEAboutToChangeLabel send: #signal to: CASEAbortTransaction.
	self remember: CASEAbortTransaction listensTo: i.
	self should: [i label: a] raise: CASEAbortTransaction.
	self should: [i label = a].
	self should: [iSpy announcements size = 1].
	self confirm: iSpy announcements first isKindOf: CASEAboutToChangeLabel of: i from: b to: a.
	self abort.
	self shouldnt: [self inTransaction].
	self should: [i label = b].
	

	
