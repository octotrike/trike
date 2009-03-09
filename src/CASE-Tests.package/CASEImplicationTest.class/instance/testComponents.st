running
testComponents
	| i j a iSpy jSpy aSpy session |
	i := self componentClass labeled: 'cog'.
	j := self componentClass labeled: 'cog'.
	a := self targetClass on: nil.
	iSpy := AnnouncementSpy on: i.
	jSpy := AnnouncementSpy on: j.
	aSpy := AnnouncementSpy on: a.
	session := self session.
	session addAll: {i. j. a.}.
	
	"When an issue gets a new component, it should trigger AboutToAddComponent, AddedComponent and include the component thereafter.  The component should trigger AboutToAddImplication, then AddedImplication and include the implication thereafter."
	a add: i.
	self should: [iSpy announcements size = 2].
	self confirm: iSpy announcements first isKindOf: CASEAboutToAddImplication on: i in: nil with: a.
	self confirm: iSpy announcements second isKindOf: CASEAddedImplication on: i in: nil with: a.
	self should: [i localImplications includes: a].
	self should: [i localImplications size = 1].
	self should: [aSpy announcements size = 2].
	self confirm: aSpy announcements first isKindOf: CASEAboutToAddComponent on: a in: nil with: i.
	self confirm: aSpy announcements second isKindOf: CASEAddedComponent on: a in: nil with: i.	
	self should: [a components includes: i].
	self should: [a components size = 1].
		
	iSpy clear.
	aSpy clear.		

	"When an issue gets a new component it already has, it should remain unchanged, It should NOT trigger AboutToAddComponent or AddedComponent, and the component should NOT trigger AboutToAddImplication or AddedImplication."
	a add: i.
	self should: [iSpy announcements isEmpty].
	self should: [aSpy announcements isEmpty].
	self should: [i localImplications includes: a].
	self should: [i localImplications size = 1].
	self should: [a components includes: i].
	self should: [a components size = 1].
	
	"When an issue which already has a component gets another component, the new component should trigger AboutToAddImplication, then AddedImplication and include the issue thereafter.  The issue should trigger AboutToAddComponent, then AddedComponent and have both components as components thereafter."
	a add: j.
	self should: [jSpy announcements size = 2].
	self confirm: jSpy announcements first isKindOf: CASEAboutToAddImplication on: j in: nil with: a.
	self confirm: jSpy announcements second isKindOf: CASEAddedImplication on: j in: nil with: a.
	self should: [j localImplications includes: a].
	self should: [j localImplications size = 1].
	self should: [aSpy announcements size = 2].
	self confirm: aSpy announcements first isKindOf: CASEAboutToAddComponent on: a in: nil with: j.
	self confirm: aSpy announcements second isKindOf: CASEAddedComponent on: a in: nil with: j.	
	self should: [a components includes: j].
	self should: [a components size = 2].
	self should: [i localImplications includes: a].
	self should: [i localImplications size = 1].
	self should: [a components includes: i].

	jSpy clear.
	aSpy clear.	

	"When an issue which has more than one component is removed from one component, the component from which the issue is removed should trigger #aboutToRemoveImplication, then #removedImplication and no longer include the issue.  The issue should trigger #aboutToRemoveComponent, then #removedComponent and no longer have the component thereafter."
	a remove: i.
	self should: [iSpy announcements size = 2].
	self confirm: iSpy announcements first isKindOf: CASEAboutToRemoveImplication on: i in: nil with: a.
	self confirm: iSpy announcements second isKindOf: CASERemovedImplication on: i in: nil with: a.
	self should: [i localImplications isEmpty].
	self should: [aSpy announcements size = 2].
	self confirm: aSpy announcements first isKindOf: CASEAboutToRemoveComponent on: a in: nil with: i.
	self confirm: aSpy announcements second isKindOf: CASERemovedComponent on: a in: nil with: i.	
	self shouldnt: [a components includes: i].
	self should: [a components size = 1].
	self should: [j localImplications includes: a].
	self should: [j localImplications size = 1].
	self should: [a components includes: j].

	iSpy clear.
	aSpy clear.	

	"When an issue is removed from a component, it should trigger #aboutToRemoveImplication, then #removedImplication and no longer include the component.  The component should trigger #aboutToRemoveComponent, then #removedComponent and no longer have the issue thereafter."
	a remove: j.
	self should: [jSpy announcements size = 2].
	self confirm: jSpy announcements first isKindOf: CASEAboutToRemoveImplication on: j in: nil with: a.
	self confirm: jSpy announcements second isKindOf: CASERemovedImplication on: j in: nil with: a.
	self should: [j localImplications isEmpty].
	self should: [aSpy announcements size = 2].
	self confirm: aSpy announcements first isKindOf: CASEAboutToRemoveComponent on: a in: nil with: j.
	self confirm: aSpy announcements second isKindOf: CASERemovedComponent on: a in: nil with: j.	
	self should: [a components isEmpty].
		
	jSpy clear.
	aSpy clear.	

	"When a component is asked to remove a nonexistent issue, it should remain unchanged.  It should NOT trigger #aboutToRemoveImplication or #removedImplication and the issue should NOT trigger #aboutToRemoveComponent or #removedComponent."
	a remove: j.
	self should: [jSpy announcements isEmpty].
	self should: [aSpy announcements isEmpty].
	self shouldnt: [j localImplications includes: a].
	self should: [j localImplications isEmpty].
	self shouldnt: [a components includes: j].
	self should: [a components isEmpty].
	
	session removeAll: {i. j. a}.

