accessing
addImplication: anImplication
	"Add an Implication that pertains to me."
	| firstActiveIssue |

	(implications includes: anImplication) ifFalse: [
		self noBalanceAddImplication: anImplication.
		anImplication noBalanceAdd: self.
			
		firstActiveIssue := anImplication isIssue and: [anImplication isActive] and: [self activeIssues size = 1].
		self trigger: #aboutToAddImplication withArguments: {self. anImplication} andPassUpIf: anImplication shouldPassUp.
		anImplication triggerEvent: #aboutToAddComponent with: {anImplication. self}.
		firstActiveIssue ifTrue: [
			self trigger: #aboutToChangeHasActiveIssues withArguments: {self. true} andPassUpIf: [:recipient :args | 
				recipient shouldPassUpHasActiveIssuesChanges: args second]]].
		
	self trigger: #addedImplication withArguments: {self. anImplication} andPassUpIf: anImplication shouldPassUp.
	anImplication triggerEvent: #addedComponent with: {anImplication. self}.
	firstActiveIssue ifTrue: [
		self trigger: #changedHasActiveIssues withArguments: {self. true} andPassUpIf: [:recipient :args | 
			recipient shouldPassUpHasActiveIssuesChanges: args second]].
	
	^anImplication
			
