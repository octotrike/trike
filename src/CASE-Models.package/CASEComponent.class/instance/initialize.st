initialization
initialize
	"Set my initial state."
	
	super initialize.
	components := self newComponents.
	implications := Set new.
	self when: #aboutToAddImplication send: #mightChangeActiveIssuesFor:becauseOf:with: to: self withArguments: {#target. #newImplication. #aboutToAddImplication}.
	self when: #addedImplication send: #mightChangeActiveIssuesFor:becauseOf:with: to: self withArguments: {#target. #newImplication. #addedImplication}.
	self when: #aboutToRemoveImplication send: #mightChangeActiveIssuesFor:becauseOf:with: to: self withArguments: {#target. #newImplication. #aboutToRemoveImplication}.
	self when: #removedImplication send: #mightChangeActiveIssuesFor:becauseOf:with: to: self withArguments: {#target. #newImplication. #removedImplication}.
	