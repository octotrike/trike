Instances of my concrete subclasses represent threats against/attacks on the requirements of a system.

Dependents of one of my instances will receive the following messages in addition to the updates sent by my superclasses:

update: #riskFactor		"my risk factor changed"
update: #exposure		"my exposure changed"

Although my model does not explicitly depend on me, I inform my model of relevant changes using the following messages:

changed: #attacks		"my name, risk or exposure changed"