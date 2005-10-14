My instances represent possible actions TrikeActors might take on TrikeAssets.

Instance variables:

action		A Symbol taken from asset possibleActions, which represents the specific action to be performed.
asset		The TrikeAsset on which this action is performed.
rule		The TrikeRule indicating when this action is allowed.
intended	True when this action is an intended action, i.e. appears in a TrikeAsset's actions Collection.  TrikeElevationOfPrivilegeThreats may refer to actions which are not intended.

name		Unused variable inherited from superclass; my name is constructed from my action and asset.

Dependents of one of my instances will receive the following messages in addition to the updates sent by my superclasses:

update: #rule		"my rule changed"