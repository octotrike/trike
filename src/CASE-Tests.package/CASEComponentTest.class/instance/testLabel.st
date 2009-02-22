running
testLabel
	| a b i session |
	a := 'foo'.
	b := 'bar'.
	i := self targetClass labeled: a.
	session := self session.
	session begin.
	session root add: i.
	session commit.
	i when: #aboutToChangeLabel send: #receiveEvent:with:andKeep: to: self withArguments: {#target. #newLabel. #aboutToChangeLabel}.
	i when: #changedLabel send: #receiveEvent:andKeep:with: to: self withArguments: {#target. #newLabel. #changedLabel}.
	
	"When an object is created with a label, it should have that label thereafter."
	self should: [i label = a].

	"When an object's label does not change, it should not trigger either #aboutToChangeLabel or #changedLabel."
	session begin.
	i label: a.
	session commit.
	self should: [receivedEvents isEmpty].
	
	"When an object's label changes, it should trigger both #aboutToChangeLabel and #changedLabel and have the new label thereafter."
	session begin.
	i label: b.
	session commit.	
	self should: [receivedEvents size = 2].
	self should: [receivedEvents first = #aboutToChangeLabel].
	self should: [receivedEvents second = b].
	self should: [i label = b].
	
	"When changing an object's label is aborted in mid-change as the result of #aboutToChangeLabel, #aboutToChangeLabel should be triggered, but #changedLabel should not, and the object should continue to have the old label."
	i when: #aboutToChangeLabel send: #signal to: CASEAbortTransaction.
	self clearReceivedEvents.
	session begin.
	self should: [i label: a] raise: CASEAbortTransaction.
	self should: [i label = a].
	session abort.
	self shouldnt: [session inTransaction].
	self should: [receivedEvents size = 1].
	self should: [receivedEvents only = #aboutToChangeLabel].
	self should: [i label = b].
	
	session begin.
	session root remove: i.
	session commit.

	
