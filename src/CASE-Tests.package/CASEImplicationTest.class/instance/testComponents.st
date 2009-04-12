running
testComponents
	| i j k l a b iSpy jSpy aSpy |
	i := self componentClass labeled: 'cog'.
	j := self componentClass labeled: 'cog'.
	k := self componentClass labeled: 'cog'.
	l := self componentClass labeled: 'cog'.
	a := self targetClass on: nil.
	b := self targetClass on: {  k. l  }.
	iSpy := self spyOn: i.
	jSpy := self spyOn: j.
	aSpy := self spyOn: a.
	self addAll: {  i. j. a. b  }.

	"When an implication is created with components, it should include them thereafter, and the components should include it."
	self should: [ k implications includes: b ].
	self should: [ k implications size = 1 ].
	self should: [ l implications includes: b ].
	self should: [ l implications size = 1 ].
	self should: [ b components includes: k ].
	self should: [ b components includes: l ].
	self should: [ b components size = 2 ].

	"When an implication is re-initialized, it should raise an error and remain the same."
	self 
		should: [ b components: {  i. j  } ]
		raise: Error.
	self should: [ k implications includes: b ].
	self should: [ k implications size = 1 ].
	self should: [ l implications includes: b ].
	self should: [ l implications size = 1 ].
	self should: [ b components includes: k ].
	self should: [ b components includes: l ].
	self should: [ b components size = 2 ].

	"When an issue gets a new component, it should trigger AboutToAddComponent, AddedComponent and include the component thereafter.  The component should trigger AboutToAddImplication, then AddedImplication and include the implication thereafter."
	a add: i.
	self should: [ iSpy announcements size >= 2 ].
	self 
		confirm: iSpy announcements first
		isKindOf: CASEAboutToAddImplication
		on: i
		with: a.
	self 
		confirm: (iSpy announcements detect: [ :ann | ann isKindOf: CASEAddedImplication ])
		isKindOf: CASEAddedImplication
		on: i
		with: a.
	self should: [ i implications includes: a ].
	self should: [ i implications size = 1 ].
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

	"When an issue gets a new component it already has, it should remain unchanged, It should NOT trigger AboutToAddComponent or AddedComponent, and the component should NOT trigger AboutToAddImplication or AddedImplication."
	a add: i.
	self should: [ iSpy announcements isEmpty ].
	self should: [ aSpy announcements isEmpty ].
	self should: [ i implications includes: a ].
	self should: [ i implications size = 1 ].
	self should: [ a components includes: i ].
	self should: [ a components size = 1 ].

	"When an issue which already has a component gets another component, the new component should trigger AboutToAddImplication, then AddedImplication and include the issue thereafter.  The issue should trigger AboutToAddComponent, then AddedComponent and have both components as components thereafter."
	a add: j.
	self should: [ jSpy announcements size >= 2 ].
	self 
		confirm: jSpy announcements first
		isKindOf: CASEAboutToAddImplication
		on: j
		with: a.
	self 
		confirm: (jSpy announcements detect: [ :ann | ann isKindOf: CASEAddedImplication ])
		isKindOf: CASEAddedImplication
		on: j
		with: a.
	self should: [ j implications includes: a ].
	self should: [ j implications size = 1 ].
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
	self should: [ a components includes: i ].
	jSpy clear.
	aSpy clear.

	"When an issue which has more than one component is removed from one component, the component from which the issue is removed should trigger #aboutToRemoveImplication, then #removedImplication and no longer include the issue.  The issue should trigger #aboutToRemoveComponent, then #removedComponent and no longer have the component thereafter."
	a remove: i.
	self should: [ iSpy announcements size >= 2 ].
	self 
		confirm: iSpy announcements first
		isKindOf: CASEAboutToRemoveImplication
		on: i
		with: a.
	self 
		confirm: (iSpy announcements detect: [ :ann | ann isKindOf: CASERemovedImplication ])
		isKindOf: CASERemovedImplication
		on: i
		with: a.
	self should: [ i implications isEmpty ].
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
	self should: [ a components includes: j ].
	iSpy clear.
	aSpy clear.

	"When an issue is removed from a component, it should trigger #aboutToRemoveImplication, then #removedImplication and no longer include the component.  The component should trigger #aboutToRemoveComponent, then #removedComponent and no longer have the issue thereafter."
	a remove: j.
	self should: [ jSpy announcements size >= 2 ].
	self 
		confirm: jSpy announcements first
		isKindOf: CASEAboutToRemoveImplication
		on: j
		with: a.
	self 
		confirm: (jSpy announcements detect: [ :ann | ann isKindOf: CASERemovedImplication ])
		isKindOf: CASERemovedImplication
		on: j
		with: a.
	self should: [ j implications isEmpty ].
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
	a remove: j.
	self should: [ jSpy announcements isEmpty ].
	self should: [ aSpy announcements isEmpty ].
	self shouldnt: [ j implications includes: a ].
	self should: [ j implications isEmpty ].
	self shouldnt: [ a components includes: j ].
	self should: [ a components isEmpty ]