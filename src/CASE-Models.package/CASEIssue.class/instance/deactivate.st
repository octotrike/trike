event handling
deactivate
	"Deactivate myself."

	isActive ifTrue: [
		self session commit: [
			isActive := false.

			self announce: (CASEAboutToChangeIsActive from: false to: true).
			components do: [:aComponent |
				aComponent announceNoActiveIssuesIfNeeded]]]
