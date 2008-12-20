running
testLabel
	| a b i |
	a := 'foo'.
	b := 'bar'.
	i := self targetClass labeled: a.
	i when: #label send: #receiveEvent: to: self with: #label.
	
	"When an object is created with a label, it should have that label thereafter."
	self should: [i label = a].

	"When an object's label does not change, it should not trigger #label."
	i label: a.
	self should: [receivedEvents isEmpty].
	
	"When an object's label changes, it should trigger #label and have the new label thereafter."
	i label: b.
	self should: [receivedEvents only = b].
	self should: [i label = b]
	
