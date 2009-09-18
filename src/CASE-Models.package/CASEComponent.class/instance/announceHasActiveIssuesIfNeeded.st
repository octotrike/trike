announce
announceHasActiveIssuesIfNeeded

	(self activeIssues size = 1) ifTrue: [
		self announce: (CASEAboutToChangeHasActiveIssues from: false to: true).
		parent ifNotNil: [parent announceHasActiveIssuesIfNeeded]]