running
testParent
	| i q r session |
	i := self targetClass labeled: 'cog'.
	q := self parentClass labeled: 'system'.
	r := self parentClass labeled: 'system'.
	session := self session.
	session addAll: {i. q. r}.
	i when: #aboutToChangeParent send: #receiveEvent:with:andKeep: to: self withArguments: {#target. #newParent. #aboutToChangeParent}.
	i when: #changedParent send: #receiveEvent:andKeep:with: to: self withArguments: {#target. #newParent. #changedParent}.
	q when: #aboutToAddComponent send: #receiveEvent:with:with:andKeep: to: self withArguments: {#target. #componentNamespace. #newComponent. #aboutToAddComponent}.
	q when: #addedComponent send: #receiveEvent:with:andKeep:with: to: self withArguments: {#target. #componentNamespace. #newComponent. #addedComponent}.
	
	"When a component gets a new parent, it should trigger #aboutToChangeParent, then #changedParent and have the new parent thereafter.  The new parent should trigger #aboutToAddComponent, then #addedComponent and include the component thereafter."
	i parent: q.
	self should: [receivedEvents includes: #aboutToChangeParent].
	self should: [receivedEvents includes: #aboutToAddComponent].
	self should: [receivedEvents includes: q]. "#newParent"
	self should: [receivedEvents includes: i]. "#newComponent"
	self should: [receivedEvents size = 4].
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
	q when: #aboutToRemoveComponent send: #receiveEvent:with:with:andKeep: to: self withArguments: {#target. #componentNamespace. #oldComponent. #aboutToRemoveComponent}.
	q when: #removedComponent send: #receiveEvent:with:andKeep:with: to: self withArguments: {#target. #componentNamespace. #oldComponent. #removedComponent}.
	r when: #aboutToAddComponent send: #receiveEvent:with:with:andKeep: to: self withArguments: {#target. #componentNamespace. #newComponent. #aboutToAddComponent}.
	r when: #addedComponent send: #receiveEvent:with:andKeep:with: to: self withArguments: {#target. #componentNamespace. #newComponent. #addedComponent}.
	
	"When a component which already has a parent gets a new parent (even one of equivalent name), it should trigger #aboutToChangeParent, then #changedParent and have the new parent as a parent thereafter.  Likewise, the old parent should trigger #aboutToRemoveComponent, then #removedComponent and no longer include the component, and the new parent should trigger #aboutToAddComponent and addedComponent and include the component thereafter."
	i parent: r.
	self should: [receivedEvents includes: #aboutToChangeParent].
	self should: [receivedEvents includes: #aboutToAddComponent].
	self should: [receivedEvents includes: #aboutToRemoveComponent].
	self should: [receivedEvents includes: r]. "#newParent"
	self should: [receivedEvents includes: i]. "#oldComponent #newComponent"
	self shouldnt: [receivedEvents includes: q]. "#oldParent"
	self should: [receivedEvents size = 6].
	self should: [i parent == r].
	self should: [r subcomponents includes: i].
	self shouldnt: [q subcomponents includes: i].
	self should: [q isEmpty].
	
	self clearReceivedEvents.
	r removeActionsWithReceiver: self.
	r when: #aboutToRemoveComponent send: #receiveEvent:with:with:andKeep: to: self withArguments: {#target. #componentNamespace. #oldComponent. #aboutToRemoveComponent}.
	r when: #removedComponent send: #receiveEvent:with:andKeep:with: to: self withArguments: {#target. #componentNamespace. #oldComponent. #removedComponent}.
	
	"When a component gets a nil parent, it should trigger #parent and have nil as a parent thereafter.  The old parent should trigger #removeComponent and no longer include the component."
	i parent: nil.
	self should: [receivedEvents includes: #aboutToChangeParent].
	self should: [receivedEvents includes: #aboutToRemoveComponent].
	self should: [receivedEvents includes: nil]. "#newParent"
	self should: [receivedEvents includes: i]. "#oldComponent"
	self should: [receivedEvents size = 4].
	self should: [i parent isNil].
	self shouldnt: [r subcomponents includes: i].
	self should: [r isEmpty].
	
	self clearReceivedEvents.
	r removeActionsWithReceiver: self.
	r when: #aboutToAddComponent send: #receiveEvent:with:with:andKeep: to: self withArguments: {#target. #componentNamespace. #newComponent. #aboutToAddComponent}.
	r when: #addedComponent send: #receiveEvent:with:andKeep:with: to: self withArguments: {#target. #componentNamespace. #newComponent. #addedComponent}.
	r when: #aboutToAddComponent send: #signal to: CASEAbortTransaction.
		
	"When changing an object's parent is interrupted in mid-change as the result of #aboutToAddComponent, #aboutToChangeParent and #aboutToAddComponent should be triggered, but #changedParent and #addedComponent should not, and the object should continue to have the old parent."
	self should: [i parent: r] raise: CASEAbortTransaction.
	self should: [i parent = r].
	session abort.
	self shouldnt: [session inTransaction].
	self should: [receivedEvents size = 2].
	self should: [receivedEvents includes: #aboutToChangeParent].
	self should: [receivedEvents includes: #aboutToAddComponent].
	self should: [i parent = nil].
	self shouldnt: [r subcomponents includes: i].
	
	session removeAll: {i. q. r}.