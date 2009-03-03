accessing
removeImplication: anImplication
	"Remove an Implication that no longer pertains to me."

	(implications includes: anImplication) ifTrue: [
		self noBalanceRemoveImplication: anImplication.
		anImplication noBalanceRemove: self.
			
		self triggerEvent: #aboutToRemoveImplication withArguments: {self. anImplication}.
		anImplication triggerEvent: #aboutToRemoveComponent withArguments: {anImplication. self}.
		
		self triggerEvent: #removedImplication withArguments: {self. anImplication}.
		anImplication triggerEvent: #removedComponent withArguments: {anImplication. self}].

	^anImplication

