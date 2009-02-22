running
testComponents
	| i j k q r session |
	i := self targetClass labeled: 'cog'.
	j := CASEComponent labeled: 'cog'.
	q := self parentClass labeled: 'system'.
	r := self parentClass labeled: 'system'.
	session := self session.
	session begin.
	session root addAll: {i. j. q. r}.
	session commit.
	i when: #aboutToChangeParent send: #receiveEvent:with:andKeep: to: self withArguments: {#target. #newParent. #aboutToChangeParent}.
	i when: #changedParent send: #receiveEvent:andKeep:with: to: self withArguments: {#target. #newParent. #changedParent}.
	q when: #aboutToAddComponent send: #receiveEvent:with:with:andKeep: to: self withArguments: {#target. #componentNamespace. #newComponent. #aboutToAddComponent}.
	q when: #addedComponent send: #receiveEvent:with:andKeep:with: to: self withArguments: {#target. #componentNamespace. #newComponent. #addedComponent}.

	"When a model gets a new component, it should trigger #aboutToAddComponent, then #addedComponent and include the component thereafter.  The new component should trigger  #aboutToChangeParent, then #changedParent and have the model as a parent thereafter."
	session begin.
	q add: i as: #subcomponent.
	session commit.
	self should: [receivedEvents includes: #aboutToChangeParent].
	self should: [receivedEvents includes: #aboutToAddComponent].
	self should: [receivedEvents includes: q]. "#newParent"
	self should: [receivedEvents includes: i]. "#newComponent"
	self should: [receivedEvents size = 4].
	self should: [i parent = q].
	self should: [q subcomponents includes: i].
	self should: [q subcomponents size = 1].
		
	self clearReceivedEvents.

	"When a model is asked to add a component it already contains in the given namespace, it should remain unchanged.  It should NOT trigger #aboutToAddComponent or #addedComponent, and the component should NOT trigger #aboutToChangeParent or #changedParent."
	session begin.
	q add: i as: #subcomponent.	
	session commit.
	self should: [receivedEvents isEmpty].
	self should: [i parent = q].
	self should: [q subcomponents includes: i].
	self should: [q subcomponents size = 1].
	
	q removeActionsWithReceiver: self.
	q when: #aboutToRemoveComponent send: #receiveEvent:with:with:andKeep: to: self withArguments: {#target. #componentNamespace. #oldComponent. #aboutToRemoveComponent}.
	q when: #removedComponent send: #receiveEvent:with:andKeep:with: to: self withArguments: {#target. #componentNamespace. #oldComponent. #removedComponent}.
	r when: #aboutToAddComponent send: #receiveEvent:with:with:andKeep: to: self withArguments: {#target. #componentNamespace. #newComponent. #aboutToAddComponent}.
	r when: #addedComponent send: #receiveEvent:with:andKeep:with: to: self withArguments: {#target. #componentNamespace. #newComponent. #addedComponent}.

	"When a component which already has a parent is added to a new model (even one of equivalent name), it should trigger #aboutToChangeParent, then #changedParent and have the new parent as a parent thereafter.  Likewise, the old parent should trigger #aboutToRemoveComponent, then #removedComponent and no longer include the component, and the new parent should trigger #aboutToAddComponent and addedComponent and include the component thereafter."
	session begin.
	r add: i as: #subcomponent.
	session commit.
	self should: [receivedEvents includes: #aboutToChangeParent].
	self should: [receivedEvents includes: #aboutToAddComponent].
	self should: [receivedEvents includes: #aboutToRemoveComponent].
	self should: [receivedEvents includes: r]. "#newParent"
	self should: [receivedEvents includes: i]. "#oldComponent #newComponent"
	self shouldnt: [receivedEvents includes: q]. "#oldParent"
	self should: [receivedEvents size = 6].
	self should: [i parent == r].
	self should: [r subcomponents includes: i].
	self should: [r subcomponents size = 1].
	self shouldnt: [q subcomponents includes: i].
	self should: [q isEmpty].

	self clearReceivedEvents.
	r when: #aboutToRemoveComponent send: #receiveEvent:with:with:andKeep: to: self withArguments: {#target. #componentNamespace. #oldComponent. #aboutToRemoveComponent}.
	r when: #removedComponent send: #receiveEvent:with:andKeep:with: to: self withArguments: {#target. #componentNamespace. #oldComponent. #removedComponent}.
	
	"When a model is asked to add a component it already contains in a different namespace, it should move the component from the old namespace to the new one.  It should trigger #aboutToRemoveComponent, #aboutToAddComponent, #removedComponent and #addedComponent, but the component should NOT trigger #aboutToChangeParent or #changedParent."
	session begin.
	r add: i as: #implementation.
	session commit.
	self shouldnt: [receivedEvents includes: #aboutToChangeParent].
	self should: [receivedEvents includes: #aboutToAddComponent].
	self should: [receivedEvents includes: #aboutToRemoveComponent].
	self shouldnt: [receivedEvents includes: r]. "#newParent"
	self should: [receivedEvents includes: i]. "#oldComponent #newComponent"
	self should: [receivedEvents size = 4].
	self should: [i parent == r].
	self should: [(r componentsIn: #implementation) includes: i].
	self should: [(r componentsIn: #implementation) size = 1].
	self should: [r subcomponents isEmpty].
	
	self clearReceivedEvents.
	
	"When a component is removed from a model, it should trigger #aboutToChangeParent, then #changedParent and have nil as a parent thereafter.  The old parent should trigger #aboutToRemoveComponent, then #removedComponent and no longer include the component."
	session begin.
	k := r remove: i as: #implementation.
	session commit.
	self should: [receivedEvents includes: #aboutToChangeParent].
	self should: [receivedEvents includes: #aboutToRemoveComponent].
	self should: [receivedEvents includes: nil]. "#parent"
	self should: [receivedEvents includes: i]. "#oldComponent"
	self should: [receivedEvents size = 4].
	self should: [k == i].
	self should: [i parent isNil].
	self shouldnt: [(r componentsIn: #implementation) includes: i].
	self should: [(r componentsIn: #implementation) isEmpty].

	self clearReceivedEvents.
	
	"When a model is asked to remove component which does not exist in the given namespace, it should answer nil and do nothing.  The component should NOT trigger #aboutToChangeParent or #changedParent, and the parent should NOT trigger #aboutToRemoveComponent or #removedComponent."
	self should: [r isEmpty].	
	session begin.
	k := r remove: i as: #subcomponent.
	session commit.
	self should: [receivedEvents isEmpty].
	self should: [k isNil].
	self should: [r isEmpty].	
	
	session begin.
	q add: i as: #subcomponent.
	session commit.
	self clearReceivedEvents.
	
	"When a model is asked to remove an equivalent component, it should answer nil and do nothing.  The component should NOT trigger #aboutToChangeParent or #changedParent, and the parent should NOT trigger #aboutToRemoveComponent or #removedComponent."
	session begin.
	k := q remove: j as: #subcomponent.
	session commit.
	self should: [receivedEvents isEmpty].
	self should: [k isNil].
	self should: [q subcomponents size = 1].	
	
	session begin.
	session root removeAll: {i. j. q. r}.
	session commit.