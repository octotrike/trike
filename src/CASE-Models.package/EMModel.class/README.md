PACKAGE

Model
Zone (Appendix I)
Data Type (Appendix 1)
	Object (subset of Appendix I)
		Kernel Type (a.k.a. entity type)
		Dependent Type (a.k.a. characteristic type)
		Association Type
		Aggregate Object Type
		Attribute Type
		Aggregate Association Type
	Connection (subset of Appendix I)
		Relationship Type
		Classification Relationship Type
		Attribute
Levels of Detail (subset of Appendix II, Part I)
	Presentation
	Professional


EMModel initializedInstance
ascending conversion
consistency rules, some of which should be turned on & off via preferences
	e.g. normalization

entity type (rectangle)
	designation (singular noun)
	[description]
	[aliases]
	[prohibitedAliases]
	determinant
	[attributes]
addAlias:

relationship type (thin solid line with single or double arrow on each end)
	[designation] (singular active verb, shown with small arrow from subject to object)
	[description]
	[aliases]
	[prohibitedAliases]
	subject
	object
	[passiveDesignation]
	subjectCardinality
	objectCardinality
	isProForma (dot at beginning of designation if false; shaded triangle if true; true requires dotted line to inherited relationship)

association type (diamond)
	designation
	[description]
	[aliases]
	[prohibitedAliases]
	determinants (related types)
	[attributes]

characteristic entity type (rectangle with box with C in upper left, characteristic arrow must enter at C)
	designation (singular noun)
	[description]
	[aliases]
	[prohibitedAliases]
	determinants (first one is the entity type of which it is a characteristic)
	[attributes]
	denotesTime (clock icon in rectangle)

classification relationship type (headless parallel line structure or heavy dark lines)
	designation
	[description]
	[aliases]
	[prohibitedAliases]
	supertype
	subtypes
	isExhaustive
	* classificationIsMandatory
	* mandatorySubtypes (x inside subtype at relationship connector entry point)
	* isExclusive
	* isVectored
	* [stateChanges] 
	isProForma (shaded triangle below L side of supertype)
	domain vs. abstract vs. imaginary (display notation for imaginary on p. 46)

state change (name inside large arrows between subtypes)
	designation
	[description]
	[aliases]
	[prohibitedAliases]
	[attributes]

attribute type (circle connected to other entity with a thin solid line, no arrows or line to list of attributes; determinants are *ed; 2 lines or (2) indicates occurrences but is discouraged)
	isProForma (true requires shaded triangle in circle with dotted line to inherited relationship)
	
aggregate object type (rectangle around all includedObjects, with designation inside)
	designation (noun)
	[description]
	[aliases]
	[prohibitedAliases]
	includedObjects
	
aggregate relationship type (trapezoid begins naming arrow, dotted lines to included relationships)
	designation
	includedRelationships
	isClassification (separate dotted lines)
 	isSeries (separate dotted lines)
EMEntityModel initializedInstance
deprecated:

caseConversionSelector: newSelector
	"Change my case conversion selector to newSelector."
	"If newSelector is not nil, immediately attempt apply newSelector to existing unique designators & aliases.  If enforcementTime is #instantly, and there are any inconsistencies, don't make any changes to any designators or aliases after all, or change caseConversionSelector; instead, raise an EMInconsistency.  If enforcementTime is #delayed and there are any inconsistencies, handle them as usual and change caseCoversionSelector."

	caseConversionSelector = newSelector ifTrue: [^self].
	newSelector ifNotNil: [
		self shouldBeImplemented].
	caseConversionSelector := newSelector

CLASS

Instances of me contain a hard-coded entity model for this package.  In typical use of EMModel, there is an instance of me for every instance of EMModel.   The entity model portions of an instance of me are not modifiable, but many of the rules can be enabled, disabled or otherwise configured.  These rules are used to enforce consistency for the corresponding instance of EMModel.

Instance Variables

namedObjects		a Dictionary (keyed by designation, alias and possibly prohibitedAlias) of all the uniquely named objects in this entity model (i.e. all instances of EMKernelType and EMAggregateObjectType); details describing complications of this structure due to rule enforcement are available in the EMModel>>addNamedObject: comment
dataObjects			a Collection of all EMDataObjectType instances which appear in this model
connections			a Collection of all EMConnectionType instances which appear in this model

zones					a Dictionary (keyed by zone designation) of all the EMZone instances which refer to this entity model

For license see https://github.com/octotrike/trike-core/blob/master/LICENSE.
