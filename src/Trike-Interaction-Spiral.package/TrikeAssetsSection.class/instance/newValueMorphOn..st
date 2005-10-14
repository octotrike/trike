initialization
newValueMorphOn: anAsset 
	"Answer a new morph on the value of anAsset."
	| result |
	result := UpdatingStringMorph new.
	result useStringFormat; target: anAsset; getSelector: #valueAsString; putSelector: #value:; setBalloonText: 'Click to enter a new value for this ' , self componentName.
	^ result