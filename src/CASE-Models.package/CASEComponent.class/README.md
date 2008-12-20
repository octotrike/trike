I am a base class for hierarchical Computer-Aided Systems Engineering models.  Each of my instances represents a model or component in a model.

Instance Variables
	label		a String humans use to identify me; included in printString and used to determine equivalence
	parent		the Component that contains me, or that I describe
	components	a Collection of Components, each of which is part of me
	issues		a Collection of Issues that pertain to me
	
	requiresUniqueLabels		a Boolean indicating whether my components must have unique labels

Events
	#label				triggered with the new label when label changes
	#parent				triggered with the new parent when parent changes
	#addComponent		triggered with the new component and the namespace it lives in, when a new component is added
	#removeComponent	triggered with the old component and the namespace it lives in, when an old component is removed
	#addIssue			triggered with the new (or reactivated) issue when a new issue is added or an existing issue is reactivated
	#removeIssue		triggered with the old issue when an isssue is removed or deactivated
	#hasActiveIssues	triggered with the new value of hasActiveIssues when the first active issue is added or activated, or the last active issue is removed or deactivated


For license see https://github.com/octotrike/trike-core/blob/master/LICENSE.
