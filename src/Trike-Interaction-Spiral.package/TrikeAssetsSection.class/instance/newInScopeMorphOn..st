initialization
newInScopeMorphOn: anAsset
	"Answer a new morph indicating whether anAsset is in scope for this system."
	| result |
	result := UpdatingThreePhaseButtonMorph radioButton.
	result target: anAsset;
		 actionSelector: #toggleInScope;
		 getSelector: #inScope;
		 setBalloonText: 'Select whether this asset is in scope for this system.'.
	^ result