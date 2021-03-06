accessing
addImplication: anImplication
	"Add an Implication that pertains to me."

	(implications includes: anImplication) ifFalse: [ 
		self session commit: [
			self noBalanceAddImplication: anImplication.
			anImplication noBalanceAdd: self.

			self announce: (CASEAboutToAddImplication object: anImplication).
			(anImplication isIssue and: [anImplication isActive]) ifTrue: [
				self announceHasActiveIssuesIfNeeded].
			anImplication announce: (CASEAboutToAddComponent object: self)]].
	
	^anImplication
			
