accessing
removeImplication: anImplication
	"Remove an Implication that no longer pertains to me."

	(implications includes: anImplication) ifTrue: [
		self session commit: [
			self noBalanceRemoveImplication: anImplication.
			anImplication noBalanceRemove: self.
	
			self announce: (CASEAboutToRemoveImplication object: anImplication).
			(anImplication isIssue and: [anImplication isActive]) ifTrue: [
				self announceNoActiveIssuesIfNeeded].
			anImplication announce: (CASEAboutToRemoveComponent object: self)]].

	^anImplication

