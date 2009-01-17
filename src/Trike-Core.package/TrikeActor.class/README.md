Each of my instances represents an active entity.  For example, a human or a process. 

-- old

Dependents of one of my instances will receive the following messages in addition to the updates sent by my superclasses:

update: #risk			"my risk changed"

In addition, although my model does not explicitly depend on me, I inform my model of relevant changes using the following messages:

changed: #actors		"my name or risk changed"

-- old

For license see https://github.com/octotrike/trike-core/blob/master/LICENSE.
