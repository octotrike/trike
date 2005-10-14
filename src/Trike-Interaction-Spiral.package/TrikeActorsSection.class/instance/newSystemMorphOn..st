initialization
newSystemMorphOn: anActor 
	"Answer a new morph indicating whether anActor is the system itself."
	| result |
	result := UpdatingThreePhaseButtonMorph radioButton.
	result target: anActor;
		 actionSelector: #toggleRepresentsSystem;
		 getSelector: #representsSystem;
		 setBalloonText: 'Select whether this actor represents the system itself.'.
	^ result