I am a base class for hierarchical Computer-Aided Systems Engineering models.  Each of my instances represents a model or component in a model.  
	- My instances can contain other Components, in arbitrary namespaces, nested arbitrarily deep.
	- My instances can have Implications.
		- These Implications can be Issues, which can be active.  

Instance Variables
	label			a String humans use to identify me; included in printString and used to determine equivalence
	parent			the Component that contains me, or that I describe
	components		a namespaced Collection of Components, each of which is part of me
	implications		a Collection of Implications that pertain to me

Instance Announcements
	AboutToChangeLabel, ChangedLabel
	AboutToChangeParent, ChangedParent
	AboutToAddComponent, AboutToRemoveComponent, AddedComponent, RemovedComponent
	AboutToChangeNamespace, ChangedNamespace
	AboutToAddImplication, AboutToRemoveImplication, AddedImplication, RemovedImplication
	AboutToChangeHasActiveIssues, ChangedHasActiveIssues
		
---- Transactions and Asynchronous Event Handling ---- 
For persistence, consistency, implications and change propagation to work correctly, every CASE model and every observer of a CASE model must follow the following guidelines:

1. Each setter method in Component and each of its subclasses must implement this sequence of events, formatted as a generic example for your cutting & pasting pleasure.  Changes to Collections require slightly different change and Anouncement creation code.

	variable = newValue ifFalse: [
		self session commit: [ | oldValue |
			"Change everything I need to change in myself."
			oldValue := variable.
			variable := newValue.
			
			"Announce the impending change."
			self announce: (CASEAboutToChangeVariable from: oldValue to: newValue)]

2. All additional changes to the model MUST occur in response to an AboutTo announcement.  A Changed announcement indicates that all associated changes have been successfully committed, so it is too late to make more.  For example, some IssueResolvers will fail in unpredictable, potentially lossy ways if the model ever changes in response to a Changed announcement.

3. All user interface updates (with the possible exception of progress indicators) must occur in response to a Changed announcement.  The change hasn't been successfully committed until this event arrives, and no cancel events will be sent, so if the user interface changes in response to an AboutTo event, it may become inconsistent with the model.

4. If you use basicNew, be sure you announce CASEAboutToCreateInstance. 


For license see https://github.com/octotrike/trike-core/blob/master/LICENSE.
