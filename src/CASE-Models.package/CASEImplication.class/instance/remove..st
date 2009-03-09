accessing
remove: aComponent
	"Remove a Component I no longer pertain to."
	
	(components includes: aComponent) ifTrue: [
		self session commit: [
			self noBalanceRemove: aComponent.
			aComponent noBalanceRemoveImplication: self.
	
			aComponent announce: (CASEAboutToRemoveImplication object: self).
			(self isIssue and: [self isActive]) ifTrue: [
				aComponent announceNoActiveIssuesIfNeeded].
			self announce: (CASEAboutToRemoveComponent object: aComponent)]].
	
	^aComponent
			
