running
testRemove
	| i j k q |

	i := CASEComponent labeled: 'cog'.
	j := CASEComponent labeled: 'cog'.
	q := CASEComponent labeled: 'system'.
	q add: i as: #subcomponent.
	i when: #parent send: #receiveEvent: to: self with: #parent.
	q when: #removeComponent send: #receiveEvent:andIgnore: to: self.
	
	"When a component is removed from a model, it should trigger #parent and have nil as a parent thereafter.  The old parent should trigger #removeComponent and no longer include the component."
	self should: [q subcomponents size = 1].
	k := q remove: i as: #subcomponent.
	self should: [receivedEvents includes: nil]. "#parent"
	self should: [receivedEvents includes: i]. "#oldComponent"
	self should: [receivedEvents size = 2].
	self should: [k == i].
	self should: [i parent isNil].
	self shouldnt: [q subcomponents includes: i].
	self should: [q isEmpty].

	self clearReceivedEvents.
	
	"When a model is asked to remove component which does not exist in the given namespace, it should answer nil and do nothing.  The component should NOT trigger #parent, and the parent should NOT trigger #removeComponent."
	self should: [q isEmpty].	
	k := q remove: i as: #subcomponent.
	self should: [receivedEvents isEmpty].
	self should: [k isNil].
	self should: [q isEmpty].	
	
	q add: i as: #subcomponent.
	self clearReceivedEvents.
	
	"When a model is asked to remove an equivalent component, it should answer nil and do nothing.  The component should NOT trigger #parent, and the parent should NOT trigger #removeComponent."
	k := q remove: j as: #subcomponent.
	self should: [receivedEvents isEmpty].
	self should: [k isNil].
	self should: [q subcomponents size = 1].	