Dependents of one of my instances will receive the following messages in addition to the updates sent by my superclasses:

update: #value		"my value changed"

In addition, although my model does not explicitly depend on me, I inform my model of relevant changes using the following messages:

changed: #assets									"my name or value changed"
changed: #anAction with: actionJustAdded		"the specified action was added"
changed: #noAction with: actionJustRemoved		"the specified action was removed"
changed: #actions									"my name or value changed"
changed: #anAttack with: attackJustAdded		"the specified attack was added"
changed: #noAttack with: attackJustRemoved		"the specified attack was removed"