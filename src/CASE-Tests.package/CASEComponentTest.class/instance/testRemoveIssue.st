running
testRemoveIssue
	| i j a |
	i := self targetClass labeled: 'cog'.
	j := self targetClass labeled: 'cog'.
	a := CASEManualIssue on: nil summary: 'teeth slip under load' description: 'either cog A is too small or cog B is off center' by: Utilities authorInitials.
	i addIssue: a.
	i when: #removeIssue send: #receiveEvent: to: self.
	j when: #removeIssue send: #receiveEvent: to: self.
	a when: #removeComponent send: #receiveEvent: to: self.
	
	"When an issue is removed from a component, it should trigger #removeComponent and no longer include the component.  The component should trigger #removeIssue and no longer have the issue thereafter."
	i removeIssue: a.
	self should: [receivedEvents includes: a]. "#oldIssue"
	self should: [receivedEvents includes: i]. "#oldComponent"
	self should: [receivedEvents size = 2].
	self shouldnt: [i localIssues includes: a].
	self should: [i localIssues isEmpty].
	self shouldnt: [a components includes: i].
	self should: [a components isEmpty].
		
	self clearReceivedEvents.

	"When a component is asked to remove a nonexistent issue, it should remain unchanged.  It should NOT trigger #removeIssue, and the issue should NOT trigger #removeComponent."
	i removeIssue: a.
	self should: [receivedEvents isEmpty].
	self shouldnt: [i localIssues includes: a].
	self should: [i localIssues isEmpty].
	self shouldnt: [a components includes: i].
	self should: [a components isEmpty].

	i addIssue: a.	
	j addIssue: a.
	self clearReceivedEvents.
	
	"When an issue which has more than one component is removed from one component, the component from which the issue is removed should trigger #removeIssue and no longer include the issue.  The issue should trigger #removeComponent and no longer have the component thereafter."
	i removeIssue: a.
	self should: [receivedEvents includes: a]. "#oldIssue"
	self should: [receivedEvents includes: i]. "#oldComponent"
	self should: [receivedEvents size = 2].
	self shouldnt: [i localIssues includes: a].
	self should: [i localIssues isEmpty].
	self should: [j localIssues includes: a].
	self should: [j localIssues size = 1].
	self shouldnt: [a components includes: i].
	self should: [a components includes: j].
	self should: [a components size = 1].
