My instances represent relationship types with no attributes.  If the association you are modeling has attributes, you probably want EMAssociationType instead.  An EMRelationshipType is considered to be an attribute of all the related DataObjects.

Relationship type - A fact type that involves two or more data objects (or a data object and itself).  The fact type is used to record references among instances of these data objects.

Instance variables:

relatedObjects		an OrderedCollection in which the first DataObject is the subject of a sentence and the remaining DataObjects are objects
designation			a String containing the verb in the sentence 

For license see https://github.com/sparagi/case-core/blob/master/LICENSE. 
