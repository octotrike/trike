running
testImplications
	| i j a session |
	i := self targetClass labeled: 'cog'.
	j := self targetClass labeled: 'cog'.
	a := CASEUserDefinedIssue on: nil summary: 'teeth slip under load' description: 'either cog A is too small or cog B is off center'.
	session := self session.
	session addAll: {i. j. a.}.
	i when: #aboutToAddImplication send: #receiveEvent:with:andKeep: to: self withArguments: {#target. #newImplication. #aboutToAddImplication}.
	i when: #addedImplication send: #receiveEvent:andKeep:with: to: self withArguments: {#target. #newImplication. #addedImplication}.
	j when: #aboutToAddImplication send: #receiveEvent:with:andKeep: to: self withArguments: {#target. #newImplication. #aboutToAddImplication}.
	j when: #addedImplication send: #receiveEvent:andKeep:with: to: self withArguments: {#target. #newImplication. #addedImplication}.
	a when: #aboutToAddComponent send: #receiveEvent:with:andKeep: to: self withArguments: {#target. #newComponent. #aboutToAddComponent}.
	a when: #addedComponent send: #receiveEvent:andKeep:with: to: self withArguments: {#target. #newComponent. #addedComponent}.
	
	"When a component gets a new issue, it should trigger #aboutToAddImplication, then #addedImplication and include the issue thereafter.  The issue should trigger #aboutToAddComponent, then #addedComponent and have the component as a component thereafter."
	i addImplication: a.
	self should: [receivedEvents includes: #aboutToAddImplication].
	self should: [receivedEvents includes: #aboutToAddComponent].
	self should: [receivedEvents includes: i].	"#newComponent"
	self should: [receivedEvents includes: a]. "#newImplication"
	self should: [receivedEvents size = 4].
	self should: [i localImplications includes: a].
	self should: [i localImplications size = 1].
	self should: [a components includes: i].
	self should: [a components size = 1].
		
	self clearReceivedEvents.

	"When a component is asked to add an issue it already has, it should remain unchanged.  It should NOT trigger #aboutToAddImplication or #addedImplication, and the issue should NOT trigger #aboutToAddComponent or #addedComponent."
	i addIssue: a.
	self should: [receivedEvents isEmpty].
	self should: [i localImplications includes: a].
	self should: [i localImplications size = 1].
	self should: [a components includes: i].
	self should: [a components size = 1].
	
	"When an issue which already has a component is added to another component, the component to which the issue is added should trigger #aboutToAddImplication, then #addedImplication and include the issue thereafter.  The issue should trigger #aboutToAddComponent, then #addedComponent and have both components as components thereafter."
	j addIssue: a.
	self should: [receivedEvents includes: #aboutToAddImplication].
	self should: [receivedEvents includes: #aboutToAddComponent].
	self should: [receivedEvents includes: a]. "#newImplication"
	self should: [receivedEvents includes: j]. "#newComponent"
	self should: [receivedEvents size = 2].
	self should: [i localImplications includes: a].
	self should: [i localImplications size = 1].
	self should: [j localImplications includes: a].
	self should: [j localImplications size = 1].
	self should: [a components includes: i].
	self should: [a components includes: j].
	self should: [a components size = 2].

	self clearReceivedEvents.
	i removeActionsWithReceiver: self.
	j removeActionsWithReceiver: self.
	a removeActionsWithReceiver: self.
	i when: #aboutToRemoveImplication send: #receiveEvent:with:andKeep: to: self withArguments: {#target. #oldImplication. #aboutToRemoveImplication}.
	i when: #removedImplication send: #receiveEvent:andKeep:with: to: self withArguments: {#target. #oldImplication. #removedImplication}.
	j when: #aboutToRemoveImplication send: #receiveEvent:with:andKeep: to: self withArguments: {#target. #oldImplication. #aboutToRemoveImplication}.
	j when: #removedImplication send: #receiveEvent:andKeep:with: to: self withArguments: {#target. #oldImplication. #removedImplication}.
	a when: #aboutToRemoveComponent send: #receiveEvent:with:andKeep: to: self withArguments: {#target. #oldComponent. #aboutToRemoveComponent}.
	a when: #removedComponent send: #receiveEvent:andKeep:with: to: self withArguments: {#target. #oldComponent. #removedComponent}.

	"When an issue which has more than one component is removed from one component, the component from which the issue is removed should trigger #aboutToRemoveImplication, then #removedImplication and no longer include the issue.  The issue should trigger #aboutToRemoveComponent, then #removedComponent and no longer have the component thereafter."
	i removeImplication: a.
	self should: [receivedEvents includes: #aboutToRemoveImplication]. 
	self should: [receivedEvents includes: #aboutToRemoveComponent]. 
	self should: [receivedEvents includes: a]. "#oldImplication"
	self should: [receivedEvents includes: i]. "#oldComponent"
	self should: [receivedEvents size = 4].
	self shouldnt: [i localImplications includes: a].
	self should: [i localImplications isEmpty].
	self should: [j localImplications includes: a].
	self should: [j localImplications size = 1].
	self shouldnt: [a components includes: i].
	self should: [a components includes: j].
	self should: [a components size = 1].
	
	"When an issue is removed from a component, it should trigger #aboutToRemoveImplication, then #removedImplication and no longer include the component.  The component should trigger #aboutToRemoveComponent, then #removedComponent and no longer have the issue thereafter."
	j removeIssue: a.
	self should: [receivedEvents includes: #aboutToRemoveImplication]. 
	self should: [receivedEvents includes: #aboutToRemoveComponent]. 
	self should: [receivedEvents includes: a]. "#oldImplication"
	self should: [receivedEvents includes: j]. "#oldComponent"
	self should: [receivedEvents size = 4].
	self shouldnt: [j localImplications includes: a].
	self should: [j localImplications isEmpty].
	self shouldnt: [a components includes: j].
	self should: [a components isEmpty].
		
	self clearReceivedEvents.

	"When a component is asked to remove a nonexistent issue, it should remain unchanged.  It should NOT trigger #aboutToRemoveImplication or #removedImplication and the issue should NOT trigger #aboutToRemoveComponent or #removedComponent."
	j removeIssue: a.
	self should: [receivedEvents isEmpty].
	self shouldnt: [j localImplications includes: a].
	self should: [j localImplications isEmpty].
	self shouldnt: [a components includes: j].
	self should: [a components isEmpty].
	
	session removeAll: {i. j. a}.

