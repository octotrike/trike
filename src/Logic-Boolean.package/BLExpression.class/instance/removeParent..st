accessing
removeParent: parentClause

	parents remove: parentClause.
	self removeActionsWithReceiver: parentClause forEvent: #clause