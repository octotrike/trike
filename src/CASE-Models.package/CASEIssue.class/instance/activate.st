event handling
activate
	"Activate myself."
	
	isActive ifFalse: [
		self session commit: [
			isActive := true.

			self announce: (CASEAboutToChangeIsActive from: false to: true).
			components do: [:aComponent |
				aComponent announceHasActiveIssuesIfNeeded]]]