running
testHasActiveIssues
	| i a b |
	i := self targetClass labeled: 'cog'.
	a := CASEManualIssue on: nil summary: 'teeth slip under load' description: 'either cog A is too small or cog B is off center' by: Utilities authorInitials.
	b := CASEManualIssue on: nil summary: 'grinding noise' description: 'loud grinding noise during threshing' by: Utilities authorInitials.
	i when: #hasActiveIssues send: #receiveEvent: to: self.
	
	"When a component with no issues gets a new active issue, it should trigger #hasActiveIssues, hasActiveIssues should answer true, and activeIssues should include the new issue."
	i addIssue: a.
	self should: [receivedEvents includes: true]. "#hasActiveIssues"
	self should: [receivedEvents size = 1].
	self should: [i hasActiveIssues].
	self should: [i activeIssues includes: a].
	self should: [i activeIssues size = 1].
			
	i removeIssue: a.
	self clearReceivedEvents.
	
	"When an active issue gets a component with no existng active issues, the component should trigger #hasActiveIssues, hasActiveIssues should answer true, and activeIssues should include the issue."
	a add: i.
	self should: [receivedEvents includes: true]. "#hasActiveIssues"
	self should: [receivedEvents size = 1].
	self should: [i hasActiveIssues].
	self should: [i activeIssues includes: a].
	self should: [i activeIssues size = 1].
	
	self clearReceivedEvents.
		
	"When a component with an existing active issue gets an active issue it already has, it should remain unchanged.  It should NOT trigger #hasActiveIssues."
	i addIssue: a.
	self should: [receivedEvents isEmpty].
	self should: [i hasActiveIssues].
	self should: [i activeIssues includes: a].
	self should: [i activeIssues size = 1].
	
	"When an issue gets a component it already has, it should remain unchanged.  The component should NOT trigger #hasActiveIssues."
	a add: i.
	self should: [receivedEvents isEmpty].
	self should: [i hasActiveIssues].
	self should: [i activeIssues includes: a].
	self should: [i activeIssues size = 1].
	
	"When a component with an existing active issue gets a second active issue, it should NOT trigger #hasActiveIssues, but hasActiveIssues should answer true and activeIssues should include the new issue."
	i addIssue: b.
	self should: [receivedEvents isEmpty].
	self should: [i hasActiveIssues].
	self should: [i activeIssues includes: a].
	self should: [i activeIssues includes: b].
	self should: [i activeIssues size = 2].
	
	i removeIssue: b.	
	
	"When an active issue gets a component with existng active issues, the component should NOT trigger #hasActiveIssues, but hasActiveIssues should answer true and activeIssues should include the issue."
	b add: i.
	self should: [receivedEvents isEmpty].
	self should: [i hasActiveIssues].
	self should: [i activeIssues includes: a].
	self should: [i activeIssues includes: b].
	self should: [i activeIssues size = 2].
		
	"When one issue pertaining to a component with multiple active issues deactivates, the component should NOT trigger #hasActiveIssues and hasActiveIssues should still answer true, but activeIssues should no longer include the deactivated issue."
	b deactivate.
	self should: [receivedEvents isEmpty].
	self should: [i hasActiveIssues].
	self should: [i activeIssues includes: a].
	self shouldnt: [i activeIssues includes: b].
	self should: [i activeIssues size = 1].
	
	b activate.	
	
	"When one issue pertaining to a component with multiple active issues is removed, the component should NOT trigger #hasActiveIssues and hasActiveIssues should still answer true, but activeIssues should no longer include the removed issue."
	i removeIssue: b.
	self should: [receivedEvents isEmpty].
	self should: [i hasActiveIssues].
	self should: [i activeIssues includes: a].
	self shouldnt: [i activeIssues includes: b].
	self should: [i activeIssues size = 1].
	
	i addIssue: b.	
			
	"When a component with multiple active issue is removed from an issue, the component should NOT trigger #hasActiveIssues and hasActiveIssues should still answer true, but activeIssues should no longer include the removed issue."
	b remove: i.
	self should: [receivedEvents isEmpty].
	self should: [i hasActiveIssues].
	self should: [i activeIssues includes: a].
	self shouldnt: [i activeIssues includes: b].
	self should: [i activeIssues size = 1].
	
	"When the last active issue pertaining to a component deactivates, the component should trigger #hasActiveIssues, hasActiveIssues should answer false, and activeIssues should be empty."
	a deactivate.
	self should: [receivedEvents includes: false]. "#hasActiveIssues"
	self should: [receivedEvents size = 1].
	self shouldnt: [i hasActiveIssues].
	self should: [i activeIssues isEmpty].
	
	a activate.
	self clearReceivedEvents.
	
	"When the last active issue pertaining to a component is removed, the component should trigger #hasActiveIssues, hasActiveIssues should answer false, and activeIssues should be empty."
	i removeIssue: a.
	self should: [receivedEvents includes: false]. "#hasActiveIssues"
	self should: [receivedEvents size = 1].
	self shouldnt: [i hasActiveIssues].
	self should: [i activeIssues isEmpty].
	
	i addIssue: a.
	self clearReceivedEvents.
		
	"When a component with no other active isues is removed from an issue, the component should trigger #hasActiveIssues, hasActiveIssues should answer false, and activeIssues should be empty."
	a remove: i.
	self should: [receivedEvents includes: false]. "#hasActiveIssues"
	self should: [receivedEvents size = 1].
	self shouldnt: [i hasActiveIssues].
	self should: [i activeIssues isEmpty].
