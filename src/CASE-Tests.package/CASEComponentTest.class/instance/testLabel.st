running
testLabel
	| a b i iSpy session ann |
	a := 'foo'.
	b := 'bar'.
	i := self targetClass labeled: a.
	iSpy := AnnouncementSpy on: i.
	session := self session.
	session add: i.
	
	"When an object is created with a label, it should have that label thereafter."
	self should: [i label = a].

	"When an object's label does not change, it should not trigger either AboutToChangeLabel or ChangedLabel."
	i label: a.
	self should: [iSpy index = 0].
	
	"When an object's label changes, it should trigger AboutToChangeLabel, then ChangedLabel and have the new label thereafter."
	i label: b.	
	self should: [iSpy index = 2].
	ann := iSpy announcements first.
	self should: [ann isKindOf: CASEAboutToChangeLabel].
	self should: [ann subject = i].
	self should: [ann oldValue = a].
	self should: [ann newValue = b].
	ann := iSpy announcements second.
	self should: [ann isKindOf: CASEChangedLabel].
	self should: [ann subject = i].
	self should: [ann oldValue = a].
	self should: [ann newValue = b].
	self should: [i label = b].
	
	iSpy clear.
	
	"When changing an object's label is aborted in mid-change as the result of AboutToChangeLabel, AboutToChangeLabel should be triggered, but ChangedLabel should not, and the object should continue to have the old label."
	i when: CASEAboutToChangeLabel send: #signal to: CASEAbortTransaction.
	self should: [i label: a] raise: CASEAbortTransaction.
	self should: [i label = a].
	session abort.
	self shouldnt: [session inTransaction].
	self should: [iSpy index = 1].
	ann := iSpy announcements first.
	self should: [ann isKindOf: CASEAboutToChangeLabel].
	self should: [ann subject = i].
	self should: [ann oldValue = b].
	self should: [ann newValue = a].
	self should: [i label = b].
	
	session remove: i.

	
