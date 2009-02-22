An instance of one of my concrete subclasses represents domain-specific data that is implied by the existence, attributes and/or relationships between one or more components or models.  

Instance Variables
	components 		an IdentitySet of Components this implication pertains to
			
Typically, my subclasses extend generic system models in order to describe and analyze domain-specific aspects of system design.  Therefore, most instances of me are created when a single component is added or modified, and deleted when the original triggering component is modified or deleted.

Events
	#aboutToAddComponent, #aboutToRemoveComponent, #addedComponent, #removedComponent


For license see https://github.com/octotrike/trike-core/blob/master/LICENSE.
