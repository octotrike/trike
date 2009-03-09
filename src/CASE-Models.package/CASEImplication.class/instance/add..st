accessing
add: aComponent
	"Add a Component I pertain to."
	
	(components includes: aComponent) ifFalse: [
		self session commit: [
			self noBalanceAdd: aComponent.
			aComponent noBalanceAddImplication: self.

			aComponent announce: (CASEAboutToAddImplication object: self).
			(self isIssue and: [self isActive]) ifTrue: [
				aComponent announceHasActiveIssuesIfNeeded].
			self announce: (CASEAboutToAddComponent object: aComponent)]].
	
	^aComponent
			
