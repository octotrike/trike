I am a base class for hierarchical Computer-Aided Systems Engineering models.  Each of my instances represents a model or component in a model.

Instance Variables
	label			a String humans use to identify me; included in printString and used to determine equivalence
	parent			the Component that contains me, or that I describe
	components		a Collection of Components, each of which is part of me
	implications		a Collection of Implications that pertain to me

Events
	#aboutToChangeLabel, #changedLabel
	#aboutToChangeParent, #changedParent
	#aboutToAddComponent, #aboutToRemoveComponent, #addedComponent, #removedComponent
	#aboutToAddImplication, #aboutToRemoveImplication, #addedImplication, #removedImplication
	#aboutToChangeHasActiveIssues, #changedHasActiveIssues
		
---- Transactions and Asynchronous Event Handling ---- 
For persistence, consistency, implications and change propagation to work correctly, every CASE model and every observer of a CASE model must follow the following basic guidelines:

1. Each setter method in Component and each of its subclasses must implement this sequence of events, formatted for your cutting & pasting pleasure:

	"Nothing has changed" ifFalse: [
		"Change everything I need to change myself."
		self triggerEvent: #aboutToChangeX withArguments: {self. "Indexing information if needed". "New value"}.
		self triggerEvent: #changedX withArguments: {self. "Indexing information if needed". "New value"}]

2. All additional changes to the model must occur in response to an aboutToChangeX event.  A changedX event indicates that all associated changes have been successfully committed.  Some issue resolution strategies will fail in unpredictable, potentially lossy ways if the model ever changes in response to a changedX event.

3. All user interface updates (with the possible exception of progress indicators) must occur in response to a changedX event.  The change hasn't been successfully committed until this event arrives, and no cancel events will be sent, so if the user interface changes in response to an aboutToChange event, it may become inconsistent with the model.


For license see https://github.com/octotrike/trike-core/blob/master/LICENSE.
