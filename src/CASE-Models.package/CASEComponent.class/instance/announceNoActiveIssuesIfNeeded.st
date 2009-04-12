announce
announceNoActiveIssuesIfNeeded

	self activeIssues ifEmpty: [
		self announce: (CASEAboutToChangeHasActiveIssues from: true to: false).
		self parent ifNotNil: [self parent announceNoActiveIssuesIfNeeded]]