Each of my instances represents a category of humans who access the system defined in my model.  You can think of an instance of me as a role in the system.

Dependents of one of my instances will receive the following messages in addition to the updates sent by my superclasses:

update: #risk			"my risk changed"

In addition, although my model does not explicitly depend on me, I inform my model of relevant changes using the following messages:

changed: #actors		"my name or risk changed"