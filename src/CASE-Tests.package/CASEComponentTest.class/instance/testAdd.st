running
testAdd
	| i q r |
	i := self targetClass labeled: 'cog'.
	q := self parentClass labeled: 'system'.
	r := self parentClass labeled: 'system'.
	i when: #parent send: #receiveEvent: to: self with: #parent.
	q when: #addComponent send: #receiveEvent:andIgnore: to: self.

	"When a model gets a new component, it should trigger #addComponent and include the component thereafter.  The new component should trigger #parent and have the model as a parent thereafter."
	q add: i as: #subcomponent.
	self should: [receivedEvents includes: q]. "#parent"
	self should: [receivedEvents includes: i]. "#newComponent"
	self should: [receivedEvents size = 2].
	self should: [i parent = q].
	self should: [q subcomponents includes: i].
	self should: [q subcomponents size = 1].
		
	self clearReceivedEvents.

	"When a model is asked to add a component it already contains in the given namespace, it should remain unchanged.  It should NOT trigger #addComponent, and the component should NOT trigger #parent."
	q add: i as: #subcomponent.	
	self should: [receivedEvents isEmpty].
	self should: [i parent = q].
	self should: [q subcomponents includes: i].
	self should: [q subcomponents size = 1].
	
	q removeActionsWithReceiver: self.
	q when: #removeComponent send: #receiveEvent:andIgnore: to: self.
	r when: #addComponent send: #receiveEvent:andIgnore: to: self.
	
	"When a component which already has a parent is added to a new model (even one of equivalent name), it should trigger #parent and have the new parent as a parent thereafter.  Likewise, the old parent should trigger #removeComponent and no longer include the component, and the new parent should trigger #addComponent and  include the component thereafter."
	r add: i as: #subcomponent.
	self should: [receivedEvents includes: r]. "#parent"
	self should: [receivedEvents includes: i]. "#oldComponent #newComponent"
	self shouldnt: [receivedEvents includes: q]. "#parent"
	self should: [receivedEvents size = 3].
	self should: [i parent == r].
	self should: [r subcomponents includes: i].
	self should: [r subcomponents size = 1].
	self should: [q subcomponents isEmpty].

	self clearReceivedEvents.
	r when: #removeComponent send: #receiveEvent:andIgnore: to: self.
	
	"When a model is asked to add a component it already contains in a different namespace, it should move the component from the old namespace to the new one.  It should trigger #removeComponent and #addComponent, but the component should NOT trigger #parent."
	r add: i as: #implementation.
	self should: [receivedEvents includes: i]. "#oldComponent #newComponent"
	self shouldnt: [receivedEvents includes: r]. "#parent"
	self should: [receivedEvents size = 2].
	self should: [i parent == r].
	self should: [(r componentsIn: #implementation) includes: i].
	self should: [(r componentsIn: #implementation) size = 1].
	self should: [r subcomponents isEmpty].
	
