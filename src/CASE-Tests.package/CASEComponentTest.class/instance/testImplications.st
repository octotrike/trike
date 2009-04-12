running
testImplications
	| i j q a iSpy jSpy aSpy |
	i := self targetClass labeled: 'cog'.
	j := self targetClass labeled: 'gear'.
	q := self parentClass labeled: 'system'.
	q addComponent: j.
	q addComponent: i.
	a := self implicationClass on: nil.
	iSpy := self spyOn: i.
	jSpy := self spyOn: j.
	aSpy := self spyOn: a.
	self addAll: {  i. j. a  }.

	"When a component gets a new issue, it should trigger #aboutToAddImplication, then #addedImplication and include the issue thereafter.  The issue should trigger #aboutToAddComponent, then #addedComponent and have the component as a component thereafter."
	i addImplication: a.
	self should: [ iSpy announcements size = 2 ].
	self 
		confirm: iSpy announcements first
		isKindOf: CASEAboutToAddImplication
		on: i
		with: a.
	self 
		confirm: iSpy announcements second
		isKindOf: CASEAddedImplication
		on: i
		with: a.
	self should: [ i implications includes: a ].
	self should: [ i implications size = 1 ].
	self should: [ i allImplications includes: a ].
	self should: [ i allImplications size = 1 ].
	self should: [ q implications isEmpty ].
	self should: [ q allImplications includes: a ].
	self should: [ q allImplications size = 1 ].
	self should: [ aSpy announcements size = 2 ].
	self 
		confirm: aSpy announcements first
		isKindOf: CASEAboutToAddComponent
		on: a
		with: i.
	self 
		confirm: aSpy announcements second
		isKindOf: CASEAddedComponent
		on: a
		with: i.
	self should: [ a components includes: i ].
	self should: [ a components size = 1 ].
	iSpy clear.
	aSpy clear.

	"When a component is asked to add an issue it already has, it should remain unchanged.  It should NOT trigger #aboutToAddImplication or #addedImplication, and the issue should NOT trigger #aboutToAddComponent or #addedComponent."
	i addImplication: a.
	self should: [ iSpy announcements isEmpty ].
	self should: [ aSpy announcements isEmpty ].
	self should: [ i implications includes: a ].
	self should: [ i implications size = 1 ].
	self should: [ i allImplications includes: a ].
	self should: [ i allImplications size = 1 ].
	self should: [ q allImplications includes: a ].
	self should: [ q allImplications size = 1 ].
	self should: [ a components includes: i ].
	self should: [ a components size = 1 ].

	"When an issue which already has a component is added to another component, the component to which the issue is added should trigger #aboutToAddImplication, then #addedImplication and include the issue thereafter.  The issue should trigger #aboutToAddComponent, then #addedComponent and have both components as components thereafter."
	j addImplication: a.
	self should: [ jSpy announcements size = 2 ].
	self 
		confirm: jSpy announcements first
		isKindOf: CASEAboutToAddImplication
		on: j
		with: a.
	self 
		confirm: jSpy announcements second
		isKindOf: CASEAddedImplication
		on: j
		with: a.
	self should: [ j implications includes: a ].
	self should: [ j implications size = 1 ].
	self should: [ j allImplications includes: a ].
	self should: [ j allImplications size = 1 ].
	self should: [ aSpy announcements size = 2 ].
	self 
		confirm: aSpy announcements first
		isKindOf: CASEAboutToAddComponent
		on: a
		with: j.
	self 
		confirm: aSpy announcements second
		isKindOf: CASEAddedComponent
		on: a
		with: j.
	self should: [ a components includes: j ].
	self should: [ a components size = 2 ].
	self should: [ i implications includes: a ].
	self should: [ i implications size = 1 ].
	self should: [ i allImplications includes: a ].
	self should: [ i allImplications size = 1 ].
	self should: [ q allImplications includes: a ].
	self should: [ q allImplications size = 1 ].
	self should: [ a components includes: i ].
	jSpy clear.
	aSpy clear.

	"When an issue which has more than one component is removed from one component, the component from which the issue is removed should trigger #aboutToRemoveImplication, then #removedImplication and no longer include the issue.  The issue should trigger #aboutToRemoveComponent, then #removedComponent and no longer have the component thereafter."
	i removeImplication: a.
	self should: [ iSpy announcements size = 2 ].
	self 
		confirm: iSpy announcements first
		isKindOf: CASEAboutToRemoveImplication
		on: i
		with: a.
	self 
		confirm: iSpy announcements second
		isKindOf: CASERemovedImplication
		on: i
		with: a.
	self should: [ i implications isEmpty ].
	self should: [ i allImplications isEmpty ].
	self should: [ aSpy announcements size = 2 ].
	self 
		confirm: aSpy announcements first
		isKindOf: CASEAboutToRemoveComponent
		on: a
		with: i.
	self 
		confirm: aSpy announcements second
		isKindOf: CASERemovedComponent
		on: a
		with: i.
	self shouldnt: [ a components includes: i ].
	self should: [ a components size = 1 ].
	self should: [ j implications includes: a ].
	self should: [ j implications size = 1 ].
	self should: [ j allImplications includes: a ].
	self should: [ j allImplications size = 1 ].
	self should: [ q allImplications includes: a ].
	self should: [ q allImplications size = 1 ].
	self should: [ a components includes: j ].
	iSpy clear.
	aSpy clear.

	"When an issue is removed from a component, it should trigger #aboutToRemoveImplication, then #removedImplication and no longer include the component.  The component should trigger #aboutToRemoveComponent, then #removedComponent and no longer have the issue thereafter."
	j removeImplication: a.
	self should: [ jSpy announcements size = 2 ].
	self 
		confirm: jSpy announcements first
		isKindOf: CASEAboutToRemoveImplication
		on: j
		with: a.
	self 
		confirm: jSpy announcements second
		isKindOf: CASERemovedImplication
		on: j
		with: a.
	self should: [ j implications isEmpty ].
	self should: [ j allImplications isEmpty ].
	self should: [ q implications isEmpty ].
	self should: [ q allImplications isEmpty ].
	self should: [ aSpy announcements size = 2 ].
	self 
		confirm: aSpy announcements first
		isKindOf: CASEAboutToRemoveComponent
		on: a
		with: j.
	self 
		confirm: aSpy announcements second
		isKindOf: CASERemovedComponent
		on: a
		with: j.
	self should: [ a components isEmpty ].
	jSpy clear.
	aSpy clear.

	"When a component is asked to remove a nonexistent issue, it should remain unchanged.  It should NOT trigger #aboutToRemoveImplication or #removedImplication and the issue should NOT trigger #aboutToRemoveComponent or #removedComponent."
	j removeImplication: a.
	self should: [ jSpy announcements isEmpty ].
	self should: [ aSpy announcements isEmpty ].
	self shouldnt: [ j implications includes: a ].
	self should: [ j implications isEmpty ].
	self shouldnt: [ j allImplications includes: a ].
	self should: [ j allImplications isEmpty ].
	self shouldnt: [ a components includes: j ].
	self should: [ a components isEmpty ]