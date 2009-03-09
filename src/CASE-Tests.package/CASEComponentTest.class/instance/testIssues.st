running
testIssues
	| i q a b session |
	i := self targetClass labeled: 'cog'.
	q := self parentClass labeled: 'system'.
	q add: i as: #subcomponent.
	a := CASEUserDefinedIssue on: nil summary: 'teeth slip under load' description: 'either cog A is too small or cog B is off center'.
	b := CASEUserDefinedIssue on: nil summary: 'grinding noise' description: 'loud grinding noise during threshing'.
	session := self session.
	session addAll: {q. a. b}.
	i when: #aboutToChangeHasActiveIssues send: #receiveAndKeepEvent:with:with: to: self withArguments: {#target. #newValue. #aboutToChangeHasActiveIssues}.
	i when: #changedHasActiveIssues send: #receiveEvent:andKeep:with: to: self withArguments: {#target. #newValue. #changedHasActiveIssues}.
	q when: #aboutToChangeHasActiveIssues send: #receiveAndKeepEvent:with:with: to: self withArguments: {#target. #newValue. #aboutToChangeHasActiveIssues}.
	q when: #changedHasActiveIssues send: #receiveEvent:andKeep:with: to: self withArguments: {#target. #newValue. #changedHasActiveIssues}.
	
	"When a component with no issues gets a new active issue, it should trigger #aboutToChangeHasActiveIssues, then #changedHasActiveIssues, hasActiveIssues should answer true, and both activeIssues and localIssues should include the new issue.   If the component's parent previously did not have any active issues, the parent should also trigger #aboutToChangeHasActiveIssues, then #changedHasActiveIssues.  The parent's hasActiveIssues should answer true, and activeIssues should include the new issue, but for the parent, localIssues should not include the new issue." 
	i addImplication: a.
	self should: [receivedEvents includes: i].		"#target"
	self should: [receivedEvents includes: q].		"#target"
	self should: [receivedEvents includes: true]. "#hasActiveIssues"
	self should: [receivedEvents size = 4].
	self should: [i hasActiveIssues].
	self should: [i activeIssues only = a].
	self should: [i localIssues only = a].
	self should: [q hasActiveIssues].
	self should: [q activeIssues only = a].
	self should: [q localIssues isEmpty].
	
	i removeImplication: a.
	self clearReceivedEvents.
	
	"When an active issue gets a component with no existng active issues, behavior should be exactly the same as for addIssue:."
	a add: i.
	self should: [receivedEvents includes: i].		"#target"
	self should: [receivedEvents includes: q].		"#target"
	self should: [receivedEvents includes: true]. "#hasActiveIssues"
	self should: [receivedEvents size = 4].
	self should: [i hasActiveIssues].
	self should: [i activeIssues only = a].
	self should: [i localIssues only = a].
	self should: [q hasActiveIssues].
	self should: [q activeIssues only = a].
	self should: [q localIssues isEmpty].
	
	self clearReceivedEvents.
		
	"When a component with an existing active issue gets an active issue it already has, it should remain unchanged.  It should NOT trigger #aboutToChangeHasActiveIssues or #changedHasActiveIssues."
	i addImplication: a.
	self should: [receivedEvents isEmpty].
	self should: [i hasActiveIssues].
	self should: [i activeIssues only = a].
	
	"When an issue gets a component it already has, it should remain unchanged.  The component should NOT trigger #aboutToChangeHasActiveIssues or #changedHasActiveIssues."
	a add: i.
	self should: [receivedEvents isEmpty].
	self should: [i hasActiveIssues].
	self should: [i activeIssues only = a].
	
	"When a component with an existing active issue gets a second active issue, it should NOT trigger #aboutToChangeHasActiveIssues or #changedHasActiveIssues, but hasActiveIssues should answer true and activeIssues should include the new issue."
	i addImplication: b.
	self should: [receivedEvents isEmpty].
	self should: [i hasActiveIssues].
	self should: [i activeIssues includes: a].
	self should: [i activeIssues includes: b].
	self should: [i activeIssues size = 2].

	i removeImplication: b.	
		
	"When an active issue gets a component with existng active issues, the component should NOT trigger #aboutToChangeHasActiveIssues or #changedHasActiveIssues, but hasActiveIssues should answer true and activeIssues should include the issue."
	b add: i.
	self should: [receivedEvents isEmpty].
	self should: [i hasActiveIssues].
	self should: [i activeIssues includes: a].
	self should: [i activeIssues includes: b].
	self should: [i activeIssues size = 2].
		
	"When one issue pertaining to a component with multiple active issues deactivates, the component should NOT trigger #aboutToChangeHasActiveIssues or #changedHasActiveIssues, localIssues should still include the issue, and hasActiveIssues should still answer true, but activeIssues should no longer include the deactivated issue."
	b deactivate.
	self should: [receivedEvents isEmpty].
	self should: [i hasActiveIssues].
	self should: [i activeIssues includes: a].
	self shouldnt: [i activeIssues includes: b].
	self should: [i activeIssues size = 1].
	self should: [i localIssues includes: a].
	self should: [i localIssues includes: b].
	self should: [i localIssues size = 2].

	b activate.	
		
	"When one issue pertaining to a component with multiple active issues is removed, the component should NOT trigger #aboutToChangeHasActiveIssues or #changedHasActiveIssues, and hasActiveIssues should still answer true, but neither localIssues nor activeIssues should still include the removed issue."
	i removeImplication: b.
	self should: [receivedEvents isEmpty].
	self should: [i hasActiveIssues].
	self should: [i activeIssues includes: a].
	self shouldnt: [i activeIssues includes: b].
	self should: [i activeIssues size = 1].
	self should: [i localIssues includes: a].
	self shouldnt: [i localIssues includes: b].
	self should: [i localIssues size = 1].
	
	i addImplication: b.
			
	"When a component with multiple active issues is removed from an issue, behavior should be exactly the same as for removeIssue:."
	b remove: i.
	self should: [receivedEvents isEmpty].
	self should: [i hasActiveIssues].
	self should: [i activeIssues includes: a].
	self shouldnt: [i activeIssues includes: b].
	self should: [i activeIssues size = 1].
	self should: [i localIssues includes: a].
	self shouldnt: [i localIssues includes: b].
	self should: [i localIssues size = 1].
	
	"When the last active issue pertaining to a component deactivates, the component should trigger #aboutToChangeHasActiveIssues, then #changedHasActiveIssues, hasActiveIssues should answer false, and activeIssues should be empty, but localIssues should still contain the inactive issue.  If this was also the last active issue for the component's parent, the parent should also trigger #aboutToChangeHasActiveIssues, then #changedHasActiveIssues.  The parent's hasActiveIssues should answer false, and neither activeIssues nor localIssues should include the new issue." 
	a deactivate.	
	self should: [receivedEvents includes: i].		"#target"
	self should: [receivedEvents includes: q].		"#target"
	self should: [receivedEvents includes: false]. "#hasActiveIssues"
	self should: [receivedEvents size = 4].
	self shouldnt: [i hasActiveIssues].
	self should: [i activeIssues isEmpty].
	self should: [i localIssues only = a].
	self shouldnt: [q hasActiveIssues].
	self should: [q activeIssues isEmpty].
	self should: [q localIssues isEmpty].
	
	a activate.
	self clearReceivedEvents.
	
	"When the last active issue pertaining to a component is removed, the component should trigger #aboutToChangeHasActiveIssues, then #changedHasActiveIssues, hasActiveIssues should answer false, and both activeIssues and localIssues should be empty.  If this was also the last active issue for the component's parent, the parent should also trigger #aboutToChangeHasActiveIssues, then #changedHasActiveIssues.  The parent's hasActiveIssues should answer false, and neither activeIssues nor localIssues should include the new issue." 
	i removeImplication: a.
	self should: [receivedEvents includes: i].		"#target"
	self should: [receivedEvents includes: q].		"#target"
	self should: [receivedEvents includes: false]. "#hasActiveIssues"
	self should: [receivedEvents size = 4].
	self shouldnt: [i hasActiveIssues].
	self should: [i activeIssues isEmpty].
	self should: [i localIssues isEmpty].
	self shouldnt: [q hasActiveIssues].
	self should: [q activeIssues isEmpty].
	self should: [q localIssues isEmpty].
	
	i addImplication: a.
	self clearReceivedEvents.
		
	"When a component with no other active isues is removed from an issue, behavior should be exactly the same as for removeIssue:."
	a remove: i.
	self should: [receivedEvents includes: i].		"#target"
	self should: [receivedEvents includes: q].		"#target"
	self should: [receivedEvents includes: false]. "#hasActiveIssues"
	self should: [receivedEvents size = 4].
	self shouldnt: [i hasActiveIssues].
	self should: [i activeIssues isEmpty].
	self should: [i localIssues isEmpty].
	self shouldnt: [q hasActiveIssues].
	self should: [q activeIssues isEmpty].
	self should: [q localIssues isEmpty].

	q addImplication: b.
	self clearReceivedEvents.
		
	"When a component with no issues gets a new active issue, it should trigger #aboutToChangeHasActiveIssues, then #changedHasActiveIssues, but if the component's parent already had active issues, the parent should NOT trigger #aboutToChangeHasActiveIssues, or #changedHasActiveIssues." 
	i addImplication: a.
	self should: [receivedEvents includes: i].		"#target"
	self should: [receivedEvents includes: true]. "#hasActiveIssues"
	self should: [receivedEvents size = 2].

	self clearReceivedEvents.
	
	"Likewise, when the last active issue is removed from a component, it should trigger #aboutToChangeHasActiveIssues, then #changedHasActiveIssues, but if the component's parent has other active issues, the parent should NOT trigger #aboutToChangeHasActiveIssues, or #changedHasActiveIssues." 
	i removeImplication: a.
	self should: [receivedEvents includes: i].		"#target"
	self should: [receivedEvents includes: false]. "#hasActiveIssues"
	self should: [receivedEvents size = 2].
	
	session removeAll: {q. a. b}.
