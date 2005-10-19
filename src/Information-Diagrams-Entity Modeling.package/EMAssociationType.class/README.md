My instances represent association types with attributes.  If the relationship you are modeling has no attributes, you probably want EMRelationshipType instead.

Association type - A data object each of whose instances is naturally existence-dependent (in a direct manner) on two or more instances of one or more other data objects.

Instance variables:

relatedObjects		an OrderedCollection in which the first DataObject is the subject of a sentence and the remaining DataObjects are objects
designation			a String containing the verb in the sentence 
		
For license see https://github.com/sparagi/case-core/blob/master/LICENSE. 	
