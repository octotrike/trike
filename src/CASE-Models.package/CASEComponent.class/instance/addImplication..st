accessing
addImplication: anImplication
	"Add an Implication that pertains to me."

	(implications includes: anImplication) ifFalse: [
		self noBalanceAddImplication: anImplication.
		anImplication noBalanceAdd: self.
			
		self triggerEvent: #aboutToAddImplication withArguments: {self. anImplication}.
		anImplication triggerEvent: #aboutToAddComponent withArguments: {anImplication. self}.
		
		self triggerEvent: #addedImplication withArguments: {self. anImplication}.
		anImplication triggerEvent: #addedComponent withArguments: {anImplication. self}].
	
	^anImplication
			
