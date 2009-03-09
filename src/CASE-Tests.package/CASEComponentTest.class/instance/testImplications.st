running
testImplications
	| i j a iSpy jSpy aSpy session |
	i := self targetClass labeled: 'cog'.
	j := self targetClass labeled: 'cog'.
	a := CASEUserDefinedIssue on: nil summary: 'teeth slip under load' description: 'either cog A is too small or cog B is off center'.
	iSpy := AnnouncementSpy on: i.
	jSpy := AnnouncementSpy on: j.
	aSpy := AnnouncementSpy on: a.
	session := self session.
	session addAll: {i. j. a.}.
	
	"When a component gets a new issue, it should trigger #aboutToAddImplication, then #addedImplication and include the issue thereafter.  The issue should trigger #aboutToAddComponent, then #addedComponent and have the component as a component thereafter."
	i addImplication: a.
	self should: [iSpy announcements size = 4].
	self confirm: iSpy announcements first isKindOf: CASEAboutToAddImplication on: i in: nil with: a.
	self confirm: iSpy announcements third isKindOf: CASEAddedImplication on: i in: nil with: a.
	self should: [i localImplications includes: a].
	self should: [i localImplications size = 1].
	self should: [aSpy announcements size = 2].
	self confirm: aSpy announcements first isKindOf: CASEAboutToAddComponent on: a in: nil with: i.
	self confirm: aSpy announcements second isKindOf: CASEAddedComponent on: a in: nil with: i.	
	self should: [a components includes: i].
	self should: [a components size = 1].
		
	iSpy clear.
	aSpy clear.		

	"When a component is asked to add an issue it already has, it should remain unchanged.  It should NOT trigger #aboutToAddImplication or #addedImplication, and the issue should NOT trigger #aboutToAddComponent or #addedComponent."
	i addImplication: a.
	self should: [iSpy announcements isEmpty].
	self should: [aSpy announcements isEmpty].
	self should: [i localImplications includes: a].
	self should: [i localImplications size = 1].
	self should: [a components includes: i].
	self should: [a components size = 1].
	
	"When an issue which already has a component is added to another component, the component to which the issue is added should trigger #aboutToAddImplication, then #addedImplication and include the issue thereafter.  The issue should trigger #aboutToAddComponent, then #addedComponent and have both components as components thereafter."
	j addImplication: a.
	self should: [jSpy announcements size = 4].
	self confirm: jSpy announcements first isKindOf: CASEAboutToAddImplication on: j in: nil with: a.
	self confirm: jSpy announcements third isKindOf: CASEAddedImplication on: j in: nil with: a.
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
	i removeImplication: a.
	self should: [iSpy announcements size = 4].
	self confirm: iSpy announcements first isKindOf: CASEAboutToRemoveImplication on: i in: nil with: a.
	self confirm: iSpy announcements third isKindOf: CASERemovedImplication on: i in: nil with: a.
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
	j removeImplication: a.
	self should: [jSpy announcements size = 4].
	self confirm: jSpy announcements first isKindOf: CASEAboutToRemoveImplication on: j in: nil with: a.
	self confirm: jSpy announcements third isKindOf: CASERemovedImplication on: j in: nil with: a.
	self should: [j localImplications isEmpty].
	self should: [aSpy announcements size = 2].
	self confirm: aSpy announcements first isKindOf: CASEAboutToRemoveComponent on: a in: nil with: j.
	self confirm: aSpy announcements second isKindOf: CASERemovedComponent on: a in: nil with: j.	
	self should: [a components isEmpty].
		
	jSpy clear.
	aSpy clear.	

	"When a component is asked to remove a nonexistent issue, it should remain unchanged.  It should NOT trigger #aboutToRemoveImplication or #removedImplication and the issue should NOT trigger #aboutToRemoveComponent or #removedComponent."
	j removeImplication: a.
	self should: [jSpy announcements isEmpty].
	self should: [aSpy announcements isEmpty].
	self shouldnt: [j localImplications includes: a].
	self should: [j localImplications isEmpty].
	self shouldnt: [a components includes: j].
	self should: [a components isEmpty].
	
	session removeAll: {i. j. a}.

