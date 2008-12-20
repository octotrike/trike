running
testAddIssue
	| i j a |
	i := self targetClass labeled: 'cog'.
	j := self targetClass labeled: 'cog'.
	a := CASEManualIssue on: nil summary: 'teeth slip under load' description: 'either cog A is too small or cog B is off center' by: Utilities authorInitials.
	i when: #addIssue send: #receiveEvent: to: self.
	j when: #addIssue send: #receiveEvent: to: self.
	a when: #addComponent send: #receiveEvent:andIgnore: to: self.
	
	"When a component gets a new issue, it should trigger #addIssue and include the issue thereafter.  The issue should trigger #addComponent and have the component as a component thereafter."
	i addIssue: a.
	self should: [receivedEvents includes: a]. "#newIssue"
	self should: [receivedEvents includes: i]. "#newComponent"
	self should: [receivedEvents size = 2].
	self should: [i localIssues includes: a].
	self should: [i localIssues size = 1].
	self should: [a components includes: i].
	self should: [a components size = 1].
		
	self clearReceivedEvents.

	"When a component is asked to add an issue it already has, it should remain unchanged.  It should NOT trigger #addIssue, and the issue should NOT trigger #addComponent."
	i addIssue: a.
	self should: [receivedEvents isEmpty].
	self should: [i localIssues includes: a].
	self should: [i localIssues size = 1].
	self should: [a components includes: i].
	self should: [a components size = 1].
	
	"When an issue which already has a component is added to another component, the component to which the issue is added should trigger #addIssue and include the issue thereafter.  The issue should trigger #addComponent and have both components as components thereafter."
	j addIssue: a.
	self should: [receivedEvents includes: a]. "#newIssue"
	self should: [receivedEvents includes: j]. "#newComponent"
	self should: [receivedEvents size = 2].
	self should: [i localIssues includes: a].
	self should: [i localIssues size = 1].
	self should: [j localIssues includes: a].
	self should: [j localIssues size = 1].
	self should: [a components includes: i].
	self should: [a components includes: j].
	self should: [a components size = 2].
