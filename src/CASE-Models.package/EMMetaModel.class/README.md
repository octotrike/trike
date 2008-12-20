PACKAGE

See EMMetaModel comment.


CLASS

Instances of me contain a hard-coded entity model for this package.  In typical use of EMModel, there is an instance of me for every instance of EMModel.   The entity model portions of an instance of me are not modifiable, but many of the rules can be enabled, disabled or otherwise configured.  These rules are used to enforce consistency for the corresponding instance of EMModel.

Instance Variables

namedObjects		a Dictionary (keyed by designation, alias and possibly prohibitedAlias) of all the uniquely named objects in this entity model (i.e. all instances of EMKernelType and EMAggregateObjectType); details describing complications of this structure due to rule enforcement are available in the EMModel>>addNamedObject: comment
dataObjects			a Collection of all EMDataObjectType instances which appear in this model
connections			a Collection of all EMConnectionType instances which appear in this model

zones					a Dictionary (keyed by zone designation) of all the EMZone instances which refer to this entity model


For license see https://github.com/octotrike/trike-core/blob/master/LICENSE.
