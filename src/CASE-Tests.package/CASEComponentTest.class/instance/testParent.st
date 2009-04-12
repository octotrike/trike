running
testParent
	| i q r iSpy qSpy rSpy |
	i := self targetClass labeled: 'cog'.
	q := self parentClass labeled: 'system'.
	r := self parentClass labeled: 'system'.
	iSpy := self spyOn: i.
	qSpy := self spyOn: q.
	rSpy := self spyOn: r.
	self addAll: {  i. q. r  }.

	"When a component gets a new parent, it should trigger #aboutToChangeParent, then #changedParent and have the new parent thereafter.  The new parent should trigger #aboutToAddComponent, then #addedComponent and include the component thereafter."
	i parent: q.
	self should: [ iSpy announcements size = 2 ].
	self 
		confirm: iSpy announcements first
		isKindOf: CASEAboutToChangeParent
		of: i
		from: nil
		to: q.
	self 
		confirm: iSpy announcements second
		isKindOf: CASEChangedParent
		of: i
		from: nil
		to: q.
	self should: [ i parent == q ].
	self should: [ qSpy announcements size = 2 ].
	self 
		confirm: qSpy announcements first
		isKindOf: CASEAboutToAddComponent
		on: q
		with: i.
	self 
		confirm: qSpy announcements second
		isKindOf: CASEAddedComponent
		on: q
		with: i.
	self should: [ q components includes: i ].
	self should: [ q components size = 1 ].
	iSpy clear.
	qSpy clear.

	"When a component gets the same parent again, it should remain unchanged.  It should NOT trigger #parent, and the parent should NOT trigger #addComponent."
	i parent: q.
	self should: [ iSpy announcements isEmpty ].
	self should: [ qSpy announcements isEmpty ].
	self should: [ i parent = q ].
	self should: [ q components includes: i ].

	"When a component which already has a parent gets a new parent (even one of equivalent name), it should trigger #aboutToChangeParent, then #changedParent and have the new parent as a parent thereafter.  Likewise, the old parent should trigger #aboutToRemoveComponent, then #removedComponent and no longer include the component, and the new parent should trigger #aboutToAddComponent and addedComponent and include the component thereafter."
	i parent: r.
	self should: [ iSpy announcements size = 2 ].
	self 
		confirm: iSpy announcements first
		isKindOf: CASEAboutToChangeParent
		of: i
		from: q
		to: r.
	self 
		confirm: iSpy announcements second
		isKindOf: CASEChangedParent
		of: i
		from: q
		to: r.
	self should: [ i parent == r ].
	self should: [ qSpy announcements size = 2 ].
	self 
		confirm: qSpy announcements first
		isKindOf: CASEAboutToRemoveComponent
		on: q
		with: i.
	self 
		confirm: qSpy announcements second
		isKindOf: CASERemovedComponent
		on: q
		with: i.
	self should: [ q isEmpty ].
	self should: [ rSpy announcements size = 2 ].
	self 
		confirm: rSpy announcements first
		isKindOf: CASEAboutToAddComponent
		on: r
		with: i.
	self 
		confirm: rSpy announcements second
		isKindOf: CASEAddedComponent
		on: r
		with: i.
	self should: [ r components includes: i ].
	self should: [ r components size = 1 ].
	iSpy clear.
	qSpy clear.
	rSpy clear.

	"When a component gets a nil parent, it should trigger #parent and have nil as a parent thereafter.  The old parent should trigger #removeComponent and no longer include the component."
	i parent: nil.
	self should: [ iSpy announcements size = 2 ].
	self 
		confirm: iSpy announcements first
		isKindOf: CASEAboutToChangeParent
		of: i
		from: r
		to: nil.
	self 
		confirm: iSpy announcements second
		isKindOf: CASEChangedParent
		of: i
		from: r
		to: nil.
	self should: [ rSpy announcements size = 2 ].
	self 
		confirm: rSpy announcements first
		isKindOf: CASEAboutToRemoveComponent
		on: r
		with: i.
	self 
		confirm: rSpy announcements second
		isKindOf: CASERemovedComponent
		on: r
		with: i.
	self should: [ i parent isNil ].
	self shouldnt: [ r components includes: i ].
	self should: [ r isEmpty ].
	iSpy clear.
	rSpy clear.

	"When changing an object's parent is interrupted in mid-change as the result of #aboutToAddComponent, #aboutToChangeParent and #aboutToAddComponent should be triggered, but #changedParent and #addedComponent should not, and the object should continue to have the old parent."
	r 
		on: CASEAboutToAddComponent
		send: #signal
		to: CASEAbortTransaction.
	self 
		remember: CASEAbortTransaction
		listensTo: r.
	self 
		should: [ i parent: r ]
		raise: CASEAbortTransaction.
	self should: [ i parent = r ].
	self should: [ r components includes: i ].
	self should: [ iSpy announcements size = 1 ].
	self 
		confirm: iSpy announcements first
		isKindOf: CASEAboutToChangeParent
		of: i
		from: nil
		to: r.
	self should: [ rSpy announcements size = 1 ].
	self 
		confirm: rSpy announcements first
		isKindOf: CASEAboutToAddComponent
		on: r
		with: i.
	self abort.
	self shouldnt: [ self inTransaction ].
	self should: [ i parent = nil ].
	self shouldnt: [ r components includes: i ]