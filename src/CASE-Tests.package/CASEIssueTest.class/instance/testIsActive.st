running
testIsActive
	| i iSpy session |
	i := self targetClass on: #().
	iSpy := self spyOn: i.
	session := self session.
	session add: i.
	
	"When first created, an Issue should be active."
	self should: [i isActive].
	
	"When deactivated, an Issue should announce AboutToChangeIsActive, then ChangedIsActive.  After deactivation, isActive should be false."
	i deactivate.
	self should: [iSpy announcements size = 2].
	self confirm: iSpy announcements first isKindOf: CASEAboutToChangeIsActive of: i from: true to: false.
	self confirm: iSpy announcements second isKindOf: CASEChangedIsActive of: i from: true to: false.
	self shouldnt: [i isActive].
	
	iSpy clear.
	
	"When reactivated, an Issue should announce AboutToChangeIsActive, then ChangedIsActive.  After reactivation, isActive should be true."
	i activate.
	self should: [iSpy announcements size = 2].
	self confirm: iSpy announcements first isKindOf: CASEAboutToChangeIsActive of: i from: false to: true.
	self confirm: iSpy announcements second isKindOf: CASEChangedIsActive of: i from: false to: true.
	self should: [i isActive].
