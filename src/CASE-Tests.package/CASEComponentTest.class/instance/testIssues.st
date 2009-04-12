running
testIssues
	| i q a b iSpy qSpy |
	i := self targetClass labeled: 'cog'.
	q := self parentClass labeled: 'system'.
	q addComponent: i.
	a := self issueClass on: nil.
	b := self issueClass on: nil.
	iSpy := self spyOn: i.
	qSpy := self spyOn: q.
	self addAll: {  q. a. b  }.

	"When a component with no issues gets a new active issue, it should trigger #aboutToChangeHasActiveIssues, then #changedHasActiveIssues, hasActiveIssues should answer true, and both activeIssues and localIssues should include the new issue.   If the component's parent previously did not have any active issues, the parent should also trigger #aboutToChangeHasActiveIssues, then #changedHasActiveIssues.  The parent's hasActiveIssues should answer true, and activeIssues should include the new issue, but for the parent, localIssues should not include the new issue."
	i addImplication: a.
	self should: [ iSpy announcements size = 4 ].
	self 
		confirm: iSpy announcements second
		isKindOf: CASEAboutToChangeHasActiveIssues
		of: i
		from: false
		to: true.
	self 
		confirm: iSpy announcements fourth
		isKindOf: CASEChangedHasActiveIssues
		of: i
		from: false
		to: true.
	self should: [ qSpy announcements size = 2 ].
	self 
		confirm: qSpy announcements first
		isKindOf: CASEAboutToChangeHasActiveIssues
		of: q
		from: false
		to: true.
	self 
		confirm: qSpy announcements second
		isKindOf: CASEChangedHasActiveIssues
		of: q
		from: false
		to: true.
	self should: [ i hasIssues ].
	self should: [ i hasActiveIssues ].
	self should: [ i activeIssues only = a ].
	self should: [ i issues only = a ].
	self should: [ i allIssues only = a ].
	self should: [ q hasIssues ].
	self should: [ q hasActiveIssues ].
	self should: [ q activeIssues only = a ].
	self should: [ q issues isEmpty ].
	self should: [ q allIssues only = a ].
	i removeImplication: a.
	iSpy clear.
	qSpy clear.

	"When an active issue gets a component with no existng active issues, behavior should be exactly the same as for addIssue:."
	a add: i.
	self should: [ iSpy announcements size = 4 ].
	self 
		confirm: iSpy announcements second
		isKindOf: CASEAboutToChangeHasActiveIssues
		of: i
		from: false
		to: true.
	self 
		confirm: iSpy announcements fourth
		isKindOf: CASEChangedHasActiveIssues
		of: i
		from: false
		to: true.
	self should: [ qSpy announcements size = 2 ].
	self 
		confirm: qSpy announcements first
		isKindOf: CASEAboutToChangeHasActiveIssues
		of: q
		from: false
		to: true.
	self 
		confirm: qSpy announcements second
		isKindOf: CASEChangedHasActiveIssues
		of: q
		from: false
		to: true.
	self should: [ i hasIssues ].
	self should: [ i hasActiveIssues ].
	self should: [ i activeIssues only = a ].
	self should: [ i issues only = a ].
	self should: [ i allIssues only = a ].
	self should: [ q hasIssues ].
	self should: [ q hasActiveIssues ].
	self should: [ q activeIssues only = a ].
	self should: [ q issues isEmpty ].
	self should: [ q allIssues only = a ].
	iSpy clear.
	qSpy clear.

	"When a component with an existing active issue gets an active issue it already has, it should remain unchanged.  It should NOT trigger #aboutToChangeHasActiveIssues or #changedHasActiveIssues."
	i addImplication: a.
	self should: [ iSpy announcements isEmpty ].
	self should: [ i hasIssues ].
	self should: [ i hasActiveIssues ].
	self should: [ i activeIssues only = a ].
	self should: [ i allIssues only = a ].

	"When an issue gets a component it already has, it should remain unchanged.  The component should NOT trigger #aboutToChangeHasActiveIssues or #changedHasActiveIssues."
	a add: i.
	self should: [ iSpy announcements isEmpty ].
	self should: [ i hasIssues ].
	self should: [ i hasActiveIssues ].
	self should: [ i activeIssues only = a ].
	self should: [ i allIssues only = a ].

	"When a component with an existing active issue gets a second active issue, it should NOT trigger #aboutToChangeHasActiveIssues or #changedHasActiveIssues, but hasActiveIssues should answer true and activeIssues should include the new issue."
	i addImplication: b.
	self 
		should: 
			[ iSpy announcements detect: [ :ann | ann isKindOf: CASEAboutToChangeHasActiveIssues ] ]
		raise: Error.
	self 
		should: 
			[ iSpy announcements detect: [ :ann | ann isKindOf: CASEChangedHasActiveIssues ] ]
		raise: Error.
	self should: [ i hasIssues ].
	self should: [ i hasActiveIssues ].
	self should: [ i activeIssues includes: a ].
	self should: [ i activeIssues includes: b ].
	self should: [ i activeIssues size = 2 ].
	self should: [ i allIssues includes: a ].
	self should: [ i allIssues includes: b ].
	i removeImplication: b.
	iSpy clear.

	"When an active issue gets a component with existng active issues, the component should NOT trigger #aboutToChangeHasActiveIssues or #changedHasActiveIssues, but hasActiveIssues should answer true and activeIssues should include the issue."
	b add: i.
	self 
		should: 
			[ iSpy announcements detect: [ :ann | ann isKindOf: CASEAboutToChangeHasActiveIssues ] ]
		raise: Error.
	self 
		should: 
			[ iSpy announcements detect: [ :ann | ann isKindOf: CASEChangedHasActiveIssues ] ]
		raise: Error.
	self should: [ i hasIssues ].
	self should: [ i hasActiveIssues ].
	self should: [ i activeIssues includes: a ].
	self should: [ i activeIssues includes: b ].
	self should: [ i activeIssues size = 2 ].
	self should: [ i allIssues includes: a ].
	self should: [ i allIssues includes: b ].
	iSpy clear.

	"When one issue pertaining to a component with multiple active issues deactivates, the component should NOT trigger #aboutToChangeHasActiveIssues or #changedHasActiveIssues, localIssues should still include the issue, and hasActiveIssues should still answer true, but activeIssues should no longer include the deactivated issue."
	b deactivate.
	self 
		should: 
			[ iSpy announcements detect: [ :ann | ann isKindOf: CASEAboutToChangeHasActiveIssues ] ]
		raise: Error.
	self 
		should: 
			[ iSpy announcements detect: [ :ann | ann isKindOf: CASEChangedHasActiveIssues ] ]
		raise: Error.
	self should: [ i hasIssues ].
	self should: [ i hasActiveIssues ].
	self should: [ i activeIssues includes: a ].
	self shouldnt: [ i activeIssues includes: b ].
	self should: [ i activeIssues size = 1 ].
	self should: [ i issues includes: a ].
	self should: [ i issues includes: b ].
	self should: [ i issues size = 2 ].
	self should: [ i allIssues includes: a ].
	self should: [ i allIssues includes: b ].
	b activate.
	iSpy clear.

	"When one issue pertaining to a component with multiple active issues is removed, the component should NOT trigger #aboutToChangeHasActiveIssues or #changedHasActiveIssues, and hasActiveIssues should still answer true, but neither localIssues nor activeIssues should still include the removed issue."
	i removeImplication: b.
	self 
		should: 
			[ iSpy announcements detect: [ :ann | ann isKindOf: CASEAboutToChangeHasActiveIssues ] ]
		raise: Error.
	self 
		should: 
			[ iSpy announcements detect: [ :ann | ann isKindOf: CASEChangedHasActiveIssues ] ]
		raise: Error.
	self should: [ i hasIssues ].
	self should: [ i hasActiveIssues ].
	self should: [ i activeIssues includes: a ].
	self shouldnt: [ i activeIssues includes: b ].
	self should: [ i activeIssues size = 1 ].
	self should: [ i issues includes: a ].
	self shouldnt: [ i issues includes: b ].
	self should: [ i issues size = 1 ].
	self should: [ i allIssues includes: a ].
	self shouldnt: [ i allIssues includes: b ].
	i addImplication: b.
	iSpy clear.

	"When a component with multiple active issues is removed from an issue, behavior should be exactly the same as for removeIssue:."
	b remove: i.
	self 
		should: 
			[ iSpy announcements detect: [ :ann | ann isKindOf: CASEAboutToChangeHasActiveIssues ] ]
		raise: Error.
	self 
		should: 
			[ iSpy announcements detect: [ :ann | ann isKindOf: CASEChangedHasActiveIssues ] ]
		raise: Error.
	self should: [ i hasIssues ].
	self should: [ i hasActiveIssues ].
	self should: [ i activeIssues includes: a ].
	self shouldnt: [ i activeIssues includes: b ].
	self should: [ i activeIssues size = 1 ].
	self should: [ i issues includes: a ].
	self shouldnt: [ i issues includes: b ].
	self should: [ i issues size = 1 ].
	self should: [ i allIssues includes: a ].
	self shouldnt: [ i allIssues includes: b ].
	iSpy clear.

	"When the last active issue pertaining to a component deactivates, the component should trigger #aboutToChangeHasActiveIssues, then #changedHasActiveIssues, hasActiveIssues should answer false, and activeIssues should be empty, but localIssues should still contain the inactive issue.  If this was also the last active issue for the component's parent, the parent should also trigger #aboutToChangeHasActiveIssues, then #changedHasActiveIssues.  The parent's hasActiveIssues should answer false, and neither activeIssues nor localIssues should include the new issue."
	a deactivate.
	self should: [ iSpy announcements size = 2 ].
	self 
		confirm: iSpy announcements first
		isKindOf: CASEAboutToChangeHasActiveIssues
		of: i
		from: true
		to: false.
	self 
		confirm: iSpy announcements second
		isKindOf: CASEChangedHasActiveIssues
		of: i
		from: true
		to: false.
	self should: [ qSpy announcements size = 2 ].
	self 
		confirm: qSpy announcements first
		isKindOf: CASEAboutToChangeHasActiveIssues
		of: q
		from: true
		to: false.
	self 
		confirm: qSpy announcements second
		isKindOf: CASEChangedHasActiveIssues
		of: q
		from: true
		to: false.
	self should: [ i hasIssues ].
	self shouldnt: [ i hasActiveIssues ].
	self should: [ i activeIssues isEmpty ].
	self should: [ i issues only = a ].
	self shouldnt: [ q hasActiveIssues ].
	self should: [ q activeIssues isEmpty ].
	self should: [ q issues isEmpty ].
	self should: [ q allIssues only = a ].
	a activate.
	iSpy clear.
	qSpy clear.

	"When the last active issue pertaining to a component is removed, the component should trigger #aboutToChangeHasActiveIssues, then #changedHasActiveIssues, hasActiveIssues should answer false, and both activeIssues and localIssues should be empty.  If this was also the last active issue for the component's parent, the parent should also trigger #aboutToChangeHasActiveIssues, then #changedHasActiveIssues.  The parent's hasActiveIssues should answer false, and neither activeIssues nor localIssues should include the new issue."
	i removeImplication: a.
	self should: [ iSpy announcements size = 4 ].
	self 
		confirm: iSpy announcements second
		isKindOf: CASEAboutToChangeHasActiveIssues
		of: i
		from: true
		to: false.
	self 
		confirm: iSpy announcements fourth
		isKindOf: CASEChangedHasActiveIssues
		of: i
		from: true
		to: false.
	self should: [ qSpy announcements size = 2 ].
	self 
		confirm: qSpy announcements first
		isKindOf: CASEAboutToChangeHasActiveIssues
		of: q
		from: true
		to: false.
	self 
		confirm: qSpy announcements second
		isKindOf: CASEChangedHasActiveIssues
		of: q
		from: true
		to: false.
	self shouldnt: [ i hasIssues ].
	self shouldnt: [ i hasActiveIssues ].
	self should: [ i activeIssues isEmpty ].
	self should: [ i issues isEmpty ].
	self shouldnt: [ q hasActiveIssues ].
	self should: [ q activeIssues isEmpty ].
	self should: [ q issues isEmpty ].
	i addImplication: a.
	iSpy clear.
	qSpy clear.

	"When a component with no other active isues is removed from an issue, behavior should be exactly the same as for removeIssue:."
	a remove: i.
	self should: [ iSpy announcements size = 4 ].
	self 
		confirm: iSpy announcements second
		isKindOf: CASEAboutToChangeHasActiveIssues
		of: i
		from: true
		to: false.
	self 
		confirm: iSpy announcements fourth
		isKindOf: CASEChangedHasActiveIssues
		of: i
		from: true
		to: false.
	self should: [ qSpy announcements size = 2 ].
	self 
		confirm: qSpy announcements first
		isKindOf: CASEAboutToChangeHasActiveIssues
		of: q
		from: true
		to: false.
	self 
		confirm: qSpy announcements second
		isKindOf: CASEChangedHasActiveIssues
		of: q
		from: true
		to: false.
	self shouldnt: [ i hasIssues ].
	self shouldnt: [ i hasActiveIssues ].
	self should: [ i activeIssues isEmpty ].
	self should: [ i issues isEmpty ].
	self shouldnt: [ q hasIssues ].
	self shouldnt: [ q hasActiveIssues ].
	self should: [ q activeIssues isEmpty ].
	self should: [ q issues isEmpty ].
	q addImplication: b.
	iSpy clear.
	qSpy clear.

	"When a component with no issues gets a new active issue, it should trigger #aboutToChangeHasActiveIssues, then #changedHasActiveIssues, but if the component's parent already had active issues, the parent should NOT trigger #aboutToChangeHasActiveIssues, or #changedHasActiveIssues."
	i addImplication: a.
	self should: [ iSpy announcements size = 4 ].
	self 
		confirm: iSpy announcements second
		isKindOf: CASEAboutToChangeHasActiveIssues
		of: i
		from: false
		to: true.
	self 
		confirm: iSpy announcements fourth
		isKindOf: CASEChangedHasActiveIssues
		of: i
		from: false
		to: true.
	self should: [ qSpy announcements isEmpty ].
	self should: [ i hasActiveIssues ].
	iSpy clear.

	"Likewise, when the last active issue is removed from a component, it should trigger #aboutToChangeHasActiveIssues, then #changedHasActiveIssues, but if the component's parent has other active issues, the parent should NOT trigger #aboutToChangeHasActiveIssues, or #changedHasActiveIssues."
	i removeImplication: a.
	self should: [ iSpy announcements size = 4 ].
	self 
		confirm: iSpy announcements second
		isKindOf: CASEAboutToChangeHasActiveIssues
		of: i
		from: true
		to: false.
	self 
		confirm: iSpy announcements fourth
		isKindOf: CASEChangedHasActiveIssues
		of: i
		from: true
		to: false.
	self should: [ qSpy announcements isEmpty ].
	self shouldnt: [ i hasActiveIssues ]