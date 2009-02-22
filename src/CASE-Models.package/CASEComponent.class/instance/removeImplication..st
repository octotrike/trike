accessing
removeImplication: anImplication
	"Remove an Implication that no longer pertains to me."
	| lastActiveIssue |

	(implications includes: anImplication) ifTrue: [
		self noBalanceRemoveImplication: anImplication.
		anImplication noBalanceRemove: self.
			
		lastActiveIssue := anImplication isIssue and: [anImplication isActive] and: [self activeIssues size = 0].
		self trigger: #aboutToRemoveImplication withArguments: {self. anImplication} andPassUpIf: anImplication shouldPassUp.
		anImplication triggerEvent: #aboutToRemoveComponent with: {anImplication. self}.
		lastActiveIssue ifTrue: [
			self trigger: #aboutToChangeHasActiveIssues withArguments: {self. false} andPassUpIf: [:recipient :args | 
				recipient shouldPassUpHasActiveIssuesChanges: args second]]].
				recipient shouldPassUpHasActiveIssuesChanges: args second]]].
				recipient shouldPassUpHasActiveIssuesChanges: args second]].

	^anImplication

