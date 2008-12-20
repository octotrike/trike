running
testRequiresUniqueLabels
	| i j q k |
	i := self targetClass labeled: 'cog'.
	j := self targetClass labeled: 'cog'.
	k := self targetClass labeled: 'gear'.
	q := self parentClass labeled: 'system'.
	q add: i as: #subcomponent.
	q add: k as: #subcomponent.
	j when: #parent send: #receiveEvent: to: self with: #parent.
	k when: #label send: #receiveEvent: to: self with: #label.
	q when: #addComponent send: #receiveEvent:andIgnore: to: self.
	q when: #addIssue send: #receiveEvent: to: self.
	
	"By default, a component should require unique component labels."
	self should: [q requiresUniqueLabels].
	
	"When a component which requires unique component labels is asked to add an equivalent but not equal component, a duplicate label issue should activate BEFORE the component triggers #parent or the parent triggers #addComponent."
	q add: j as: #subcomponent.
	self should: [receivedEvents first isKindOf: CASEDuplicateLabelIssue]. "#newIssue"
	self should: [receivedEvents includes: q]. "#parent"
	self should: [receivedEvents includes: j]. "#newComponent"
	self should: [receivedEvents size = 4].
	self should: [j parent = q].
	self should: [q subcomponents includes: j].
	self should: [q activeIssues size = 1].
	
	q remove: j as: #subcomponent.
	self clearReceivedEvents.
		
	"Likewise, when a component attempts to change its parent to a model which requires unique component labels and which already contains a component with the same label, a duplicate label issue should activate BEFORE the component triggers #parent or the parent triggers #addComponent."
	j parent: q.
	self should: [receivedEvents first isKindOf: CASEDuplicateLabelIssue]. "#newIssue"
	self should: [receivedEvents includes: q]. "#parent"
	self should: [receivedEvents includes: j]. "#newComponent"
	self should: [receivedEvents size = 4].
	self should: [j parent = q].
	self should: [q subcomponents includes: j].
	self should: [q activeIssues size = 1].

	q remove: j as: #subcomponent.
	self clearReceivedEvents.
	
	"When a component attempts to change its label to be equivalent to another component in the same model and that model does not allow duplicate labels, a duplicate label issue should activate BEFORE the component triggers #label."
	k label: 'cog'.
	self should: [receivedEvents first isKindOf: CASEDuplicateLabelIssue]. "#newIssue"
	self should: [receivedEvents includes: 'cog']. "#newLabel"
	self should: [receivedEvents size = 3].
	self should: [k label = 'cog'].
	self should: [q activeIssues size = 1].
	
	k label: 'gear'.
	self clearReceivedEvents.	
		
	"It should be possible to turn off checks for unique component labels."
	q requiresUniqueLabels: false.
	self shouldnt: [q requiresUniqueLabels].
	
	"When a model which does NOT require unique component labels is asked to add an equivalent but not equal component, it should work as usual: the component should trigger #parent and the parent should trigger #addComponent."
	q add: j as: #subcomponent.
	self should: [receivedEvents includes: q]. "#parent"
	self should: [receivedEvents includes: j]. "#newComponent"
	self should: [receivedEvents size = 2].
	self should: [j parent = q].
	self should: [q subcomponents includes: j].
	self shouldnt: [q hasActiveIssues].
	
	q remove: j as: #subcomponent.
	self clearReceivedEvents.
	
	"Likewise, when a component attempts to change its parent to a model which does NOT require unique component labels, it should work as usual: the component should trigger #parent and the parent should trigger #addComponent."
	j parent: q.
	self should: [receivedEvents includes: q]. "#parent"
	self should: [receivedEvents includes: j]. "#newComponent"
	self should: [receivedEvents size = 2].
	self should: [j parent = q].
	self should: [q subcomponents includes: j].
	self shouldnt: [q hasActiveIssues].

	q remove: j as: #subcomponent.
	self clearReceivedEvents.
	
	"When a component becomes equivalent to another component in the same model and that model allows duplicate labels, it should work as usual: the component should trigger #label."
	k label: 'cog'.
	self should: [receivedEvents includes: 'cog']. "#newLabel"
	self should: [receivedEvents size = 1].
	self should: [k label = 'cog'].
	self shouldnt: [q hasActiveIssues].
	
	self clearReceivedEvents.
	
	"When a model which has not required unique component labels starts requiring them, and equivalent components are already present, a duplicate label issue should activate."
	self shouldnt: [q hasActiveIssues].
	q requiresUniqueLabels: true.
	self should: [receivedEvents first isKindOf: CASEDuplicateLabelIssue]. "#newIssue"
	self should: [receivedEvents size = 2].
	self should: [q hasActiveIssues].