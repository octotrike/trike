announce
announceNoActiveIssuesIfNeeded

	self activeIssues ifEmpty: [
		self announce: (CASEAboutToChangeHasActiveIssues from: true to: false).
		parent ifNotNil: [parent announceNoActiveIssuesIfNeeded]]