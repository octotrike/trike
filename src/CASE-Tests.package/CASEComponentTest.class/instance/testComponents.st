running
testComponents
	| i j k q r iSpy qSpy rSpy session |
	i := self targetClass labeled: 'cog'.
	j := CASEComponent labeled: 'cog'.
	q := self parentClass labeled: 'system'.
	r := self parentClass labeled: 'system'.
	iSpy := AnnouncementSpy on: i.
	qSpy := AnnouncementSpy on: q.
	rSpy := AnnouncementSpy on: r.
	session := self session.
	session addAll: {i. j. q. r}.

	"When a model gets a new component, it should trigger #aboutToAddComponent, then #addedComponent and include the component thereafter.  The new component should trigger  #aboutToChangeParent, then #changedParent and have the model as a parent thereafter."
	q add: i as: #subcomponent.
	self should: [iSpy announcements size = 2].
	self confirm: iSpy announcements first isKindOf: CASEAboutToChangeParent of: i from: nil to: q.
	self confirm: iSpy announcements second isKindOf: CASEChangedParent of: i from: nil to: q.
	self should: [i parent == q].
	self should: [qSpy announcements size = 2].
	self confirm: qSpy announcements first isKindOf: CASEAboutToAddComponent on: q in: #subcomponent with: i.
	self confirm: qSpy announcements second isKindOf: CASEAddedComponent on: q in: #subcomponent with: i.
	self should: [q subcomponents includes: i].
	self should: [q subcomponents size = 1].

	iSpy clear.
	qSpy clear.		

	"When a model is asked to add a component it already contains in the given namespace, it should remain unchanged.  It should NOT trigger #aboutToAddComponent or #addedComponent, and the component should NOT trigger #aboutToChangeParent or #changedParent."
	q add: i as: #subcomponent.	
	self should: [iSpy announcements isEmpty].
	self should: [qSpy announcements isEmpty].
	self should: [i parent = q].
	self should: [q subcomponents includes: i].
	self should: [q subcomponents size = 1].

	"When a component which already has a parent is added to a new model (even one of equivalent name), it should trigger #aboutToChangeParent, then #changedParent and have the new parent as a parent thereafter.  Likewise, the old parent should trigger #aboutToRemoveComponent, then #removedComponent and no longer include the component, and the new parent should trigger #aboutToAddComponent and addedComponent and include the component thereafter."
	r add: i as: #subcomponent.
	self should: [iSpy announcements size = 2].
	self confirm: iSpy announcements first isKindOf: CASEAboutToChangeParent of: i from: q to: r.
	self confirm: iSpy announcements second isKindOf: CASEChangedParent of: i from: q to: r.
	self should: [i parent == r].
	self should: [qSpy announcements size = 2].
	self confirm: qSpy announcements first isKindOf: CASEAboutToRemoveComponent on: q in: #subcomponent with: i.
	self confirm: qSpy announcements second isKindOf: CASERemovedComponent on: q in: #subcomponent with: i.
	self should: [q isEmpty].
	self should: [rSpy announcements size = 2].
	self confirm: rSpy announcements first isKindOf: CASEAboutToAddComponent on: r in: #subcomponent with: i.
	self confirm: rSpy announcements second isKindOf: CASEAddedComponent on: r in: #subcomponent with: i.
	self should: [r subcomponents includes: i].
	self should: [r subcomponents size = 1].

	iSpy clear.
	qSpy clear.	
	rSpy clear.
	
	"When a model is asked to add a component it already contains in a different namespace, it should move the component from the old namespace to the new one.  It should trigger #aboutToRemoveComponent, #aboutToAddComponent, #removedComponent and #addedComponent, but the component should NOT trigger #aboutToChangeParent or #changedParent."
	r add: i as: #implementation.
	self should: [iSpy announcements isEmpty].
	self should: [rSpy announcements size = 4].
	self confirm: rSpy announcements first isKindOf: CASEAboutToRemoveComponent on: r in: #subcomponent with: i.
	self confirm: rSpy announcements second isKindOf: CASEAboutToAddComponent on: r in: #implementation with: i.
	self confirm: rSpy announcements third isKindOf: CASERemovedComponent on: r in: #subcomponent with: i.
	self confirm: rSpy announcements fourth isKindOf: CASEAddedComponent on: r in: #implementation with: i.
	self should: [i parent == r].
	self should: [(r componentsIn: #implementation) includes: i].
	self should: [(r componentsIn: #implementation) size = 1].
	self should: [r subcomponents isEmpty].
	
	rSpy clear.
	
	"When a component is removed from a model, it should trigger #aboutToChangeParent, then #changedParent and have nil as a parent thereafter.  The old parent should trigger #aboutToRemoveComponent, then #removedComponent and no longer include the component."
	k := r remove: i as: #implementation.
	self should: [iSpy announcements size = 2].
	self confirm: iSpy announcements first isKindOf: CASEAboutToChangeParent of: i from: r to: nil.
	self confirm: iSpy announcements second isKindOf: CASEChangedParent of: i from: r to: nil.
	self should: [rSpy announcements size = 2].
	self confirm: rSpy announcements first isKindOf: CASEAboutToRemoveComponent on: r in: #implementation with: i.
	self confirm: rSpy announcements second isKindOf: CASERemovedComponent on: r in: #implementation with: i.
	self should: [k == i].
	self should: [i parent isNil].
	self should: [(r componentsIn: #implementation) isEmpty].

	iSpy clear.
	rSpy clear.
	
	"When a model is asked to remove component which does not exist in the given namespace, it should answer nil and do nothing.  The component should NOT trigger #aboutToChangeParent or #changedParent, and the parent should NOT trigger #aboutToRemoveComponent or #removedComponent."
	self should: [r isEmpty].	
	k := r remove: i as: #subcomponent.
	self should: [iSpy announcements isEmpty].
	self should: [rSpy announcements isEmpty].
	self should: [k isNil].
	self should: [r isEmpty].	
	
	q add: i as: #subcomponent.
	iSpy clear.
	qSpy clear.
	
	"When a model is asked to remove an equivalent component, it should answer nil and do nothing.  The component should NOT trigger #aboutToChangeParent or #changedParent, and the parent should NOT trigger #aboutToRemoveComponent or #removedComponent."
	k := q remove: j as: #subcomponent.
	self should: [iSpy announcements isEmpty].
	self should: [qSpy announcements isEmpty].
	self should: [k isNil].
	self should: [q subcomponents size = 1].	
	
	session removeAll: {i. j. q. r}.