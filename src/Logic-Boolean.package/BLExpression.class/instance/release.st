initialization
release

	super release.
	self 
		removeActionsWithReceiver: self forEvent: #string;
		removeActionsWithReceiver: self forEvent: #negated