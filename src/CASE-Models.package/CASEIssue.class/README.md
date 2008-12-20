An instance of me represents something unknown or undecided, without which a Computer-Aided Systems Engineering model is ambiguous or complete, or an inconsistency between two or more parts of the model or the model and its parent model.

Instance Variables
	components	a Dictionary whose keys are subclass-specific and whose values are Collections of Components this issue pertains to
	assignedTo	the human who is responsible for resolving this issue
	severity		an Integer indicating how severe this issue is
	isActive		a Boolean indicating whether this issue is currently active
	history		a Collection of Events that have affected this issue
			
An instance of me typically follows this lifecycle:
	- initial creation & activation
	- modification (optional)
	- deactivation, possibly including deletion
	- reactivation (optional)
	- deletion (optional)


For license see https://github.com/octotrike/trike-core/blob/master/LICENSE.
