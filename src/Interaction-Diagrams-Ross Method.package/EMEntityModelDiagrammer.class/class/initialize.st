initialization
initialize
	"Initialize my map from model classes to morphs."

	super initialize.
	ModelToMorph := Dictionary new.
	
	"Object data types & other objects"
	ModelToMorph
		at: EMKernelType put: EMKernelTypeMorph;
		at: EMDependentType put: EMDependentTypeMorph;
		at: EMAssociationType put: EMAssociationTypeMorph;
		at: EMAttributeType put: EMAttributeTypeMorph;
		at: EMAggregateObjectType put: EMAggregateObjectTypeMorph;
		at: EMAlias put: EMAliasMorph.
		
	"Relationships & other connections"
	ModelToMorph
		at: EMRelationship put: EMRelationshipMorph;
		at: EMClassificationRelationship put: EMClassificationRelationshipMorph.	
		
	
	