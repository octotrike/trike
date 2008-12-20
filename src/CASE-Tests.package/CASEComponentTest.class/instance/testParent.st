running
testParent
	| i q r |
	i := self targetClass labeled: 'cog'.
	q := self parentClass labeled: 'system'.
	r := self parentClass labeled: 'system'.
	i when: #parent send: #receiveEvent: to: self with: #parent.
	q when: #addComponent send: #receiveEvent:andIgnore: to: self.
	
	"When a component gets a new parent, it should trigger #parent and have the new parent thereafter.  The new parent should trigger #addComponent and include the component thereafter."
	i parent: q.
	self should: [receivedEvents includes: q]. "#parent"
	self should: [receivedEvents includes: i]. "#newComponent"
	self should: [receivedEvents size = 2].
	self should: [i parent = q].
	self should: [q subcomponents includes: i].
	
	self clearReceivedEvents.
		
	"When a component gets the same parent again, it should remain unchanged.  It should NOT trigger #parent, and the parent should NOT trigger #addComponent."
	i parent: q.
	self should: [receivedEvents isEmpty].
	self should: [i parent = q].
	self should: [q subcomponents includes: i].
.
	q removeActionsWithReceiver: self.
	q when: #removeComponent send: #receiveEvent:andIgnore: to: self.
	r when: #addComponent send: #receiveEvent:andIgnore: to: self.
	
	"When a component which already has a parent gets a new parent (even one of equivalent name), it should trigger #parent and have the new parent as a parent thereafter.  Likewise, the old parent should trigger #removeComponent and no longer include the component, and the new parent should trigger #addComponent and  include the component thereafter."
	i parent: r.
	self should: [receivedEvents includes: r]. "#parent"
	self should: [receivedEvents includes: i]. "#oldComponent #newComponent"
	self shouldnt: [receivedEvents includes: q]. "#parent"
	self should: [receivedEvents size = 3].
	self should: [i parent == r].
	self should: [r subcomponents includes: i].
	self shouldnt: [q subcomponents includes: i].
	self should: [q isEmpty].
	
	self clearReceivedEvents.
	r removeActionsWithReceiver: self.
	r when: #removeComponent send: #receiveEvent:andIgnore: to: self.
	
	"When a component gets a nil parent, it should trigger #parent and have nil as a parent thereafter.  The old parent should trigger #removeComponent and no longer include the component."
	i parent: nil.
	self should: [receivedEvents includes: nil]. "#parent"
	self should: [receivedEvents includes: i]. "#oldComponent"
	self should: [receivedEvents size = 2].
	self should: [i parent isNil].
	self shouldnt: [r subcomponents includes: i].
	self should: [r isEmpty].