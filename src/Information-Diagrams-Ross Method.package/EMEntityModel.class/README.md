PACKAGE SUITE

This package is part of a set of related packages which allow modeling of business requirements using Ross Method, based on Ronald G. Ross' books, _The Business Rule Book: Classifying, Defining and Modeling Rules_ 2nd edition and _Entity Modeling: Techniques and Applications_.   As of May 2006, Ross Method is one of two business rules modeling methods in widespread use by the database community.   It is a completely declarative (non-procedural), data-centric, diagrammatic method for modeling integrity rules.   My author is unaware of any other implementations of this method which allow native (i.e. diagram-based) editing of business rules.

The diagram editing capabilities of these packages rely heavily on Nathanael Schärli's Genie library (now maintained by Ned Konz) for gesture recognition and Ned Konz's Connectors package for structured diagram editing.

Information-Diagrams-Ross Method		entity/data/rules modeling library
Interaction-Diagrams-Editor					gesture-based diagram editor
Interaction-Diagrams-Ross Method			plug-in for editing entity models & business rules

Complete information about these packages, including links to any other uses or human interfaces anyone else may have constructed, is available at http://www.hhhh.org/asparagi/RequirementsModeling/.


PACKAGE

This package contains the data model for entity models created using Ronald G. Ross' conventions, as presented in Appendix  1 of _The Business Rule Book: Classifying, Defining and Modeling Rules_ 2nd edition and Part I of _Entity Modeling: Techniques and Applications_.   This package only includes the data model needed to create entity models to the Presentation or Professional levels of detail.  It includes some support for ascending conversion.

An instance of EMModel represents an entity model, which contains EMDataObjectType instances (data entities in the entity model, and their attributes), and EMConnectionType instances (connections between the data entities).   Instances of RMBusinessRule are used to express business rules (requirements) which apply to the data objects they reference.  A good way to get a solid overview of this package would be to use the diagram editor to look at EMModel metaEntityModel, then read the class comments for the four classes listed above.

An instance of EMZone represents a specific subset of an EMModel instance, typically a subset which would clearly express some aspect of the entity model to a particular human audience.  An EMInconsistency is an error involving conflict between two or more parts of an entity model.

Tests for the classes in this package use the SUnit framework and can be found in the Information-Diagrams-Entity Modeling-Tests category.  Many tests are taken from Ronald G. Ross' books; others test the entity model for this package.


CLASS

Instances of me represent entity models.  This model is comprised of EMDataObjectType instances (data entities in the entity model, and their attributes), and EMConnectionType instances (connections between the data entities).  

My instances have 3 responsibilities:
	- enumerate data object & connection types this entity model includes
	- look up included data object types by their unique names or aliases, or names and determinants as appropriate
	- enforce entity model integrity rules according to instance-specific settings

Enumeration

Type Lookup

Rule Enforcement

An instance of me enforces entity model integrity rules (frequently with the help of other classes in this package).  The following rules are always enforced:

Designations and aliases of EMKernelType and EMAggregateObjectType instances must be unique within an entity model.
An instance of EMDataObjectType cannot have a designation or alias which KernelType or EMAggregateObjectType
Designations of EMZone instances which refer to an entity model must be unique within that entity model.

Enforcement of the following rules is configurable on a per-model basis (wouldn't it be cool if we were using a business rules engine to do this?): 

	model modelWideAliasProhibition: true	"No EMKernelType or EMAggregateObjectType instance in an entity model can have a designation or alias which is a prohibited alias for any other EMKernelType or EMAggregateObjectType instance in the same entity model."
	model caseConversionSelector: aSelector	"If non-nil, every designation or alias used in the model will be converted to known case using the provided selector before any comparison or storage occurs."

The following settings control how rules are enforced on a per-model basis:

	model caseSensitive: true	"Designation and alias equivalence is determined case sensitively, i.e. Foo and FOO are different."
	model caseSensitive: false	"Designation and alias equivalence is determined regardless of case, i.e. Foo and FOO are the same."	

Methods which change rule settings may cause changes to the model (e.g. caseCoversion:) or model inconsistencies (e.g. modelWideAliasProhibition:), or both.  Changes to the model will occur instantly, and are typically not reversible.  Inconstencies will be treated according to the enforcementTime setting described below.  Possible side effects of all methods which change rule settings are detailed in the comments of those methods.

Integrity rules for entity models can be enforced instantly, or delayed.  Instant enforcement raises an EMInconsistency at the moment a user attempts to change the entity model in an inconsistent way, instead of making the requested change.  Delayed enforcement allows inconsistent changes to the model, but maintains a list of inconsistencies which need to be resolved in the future.  EMInconsistency instances will still be raised immediately for inconsistencies so large they are unrecoverable. 

This behavior is controlled by the enforcementTime instance variable (which can be changed using EMModel>>enforcementTime:) and requires cooperation from other classes in this package.

	model enforcementTime: #delayed.	"Valid at any time"
	model enforcementTime: #instant.		"Valid only when there are no current inconsistencies in the model; if there are any an EMInconsistency will be raised now and enforcementTime will be unchanged."
	aCollection := model inconsistencies.	"Answer the current list of EMInconsistency instances associated with this model."
		
All settings which affect rule enforcement are enumerated for human interaction purposes using the Interaction-Action framework.

Instance Variables

namedObjects		a Dictionary (keyed by designation, alias and possibly prohibitedAlias) of all the uniquely named objects in this entity model (i.e. all instances of EMKernelType and EMAggregateObjectType); details describing complications of this structure due to rule enforcement are available in the EMModel>>addNamedObject: comment
dataObjects			a Collection of all EMDataObjectType instances which appear in this model
connections			a Collection of all EMConnectionType instances which appear in this model

zones					a Dictionary (keyed by zone designation) of all the EMZone instances which refer to this entity model
					
enforcementTime			#delayed or #instant as described in the Rule Enforcement section above
caseConversionSelector
caseSensitive
modelWideAliasProhibition


For license see https://github.com/octotrike/trike-core/blob/master/LICENSE.
