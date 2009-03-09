event handling
deactivate
	"Deactivate myself."

	isActive ifTrue: [
		self session commit: [
			isActive := false.

			self announce: (CASEAboutToChangeIsActive from: true to: false).
			components do: [:aComponent |
				aComponent announceNoActiveIssuesIfNeeded]]]
