accessing
components: aCollection
	"Set my Collection of Components."
	
	components ifNotEmpty: [self error: 'components cannot be reset after initialization'].
	
	aCollection ifNotNil: [
		self session commit: [
			aCollection do: [:c |
				self noBalanceAdd: c.
				c noBalanceAddImplication: self.

				c announce: (CASEAboutToAddImplication object: self).
				(self isIssue and: [self isActive]) ifTrue: [
					c announceHasActiveIssuesIfNeeded].
				self announce: (CASEAboutToAddComponent object: c)]]]
