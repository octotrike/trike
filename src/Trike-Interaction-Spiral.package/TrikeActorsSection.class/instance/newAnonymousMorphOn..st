initialization
newAnonymousMorphOn: anActor 
	"Answer a new morph indicating whether anActor is anonymous."
	| result |
	result := UpdatingThreePhaseButtonMorph radioButton.
	result target: anActor;
		 actionSelector: #toggleAnonymous;
		 getSelector: #isAnonymous;
		 setBalloonText: 'Select whether this actor is intentionally unauthenticated.'.
	^ result