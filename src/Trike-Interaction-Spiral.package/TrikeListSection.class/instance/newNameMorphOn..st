initialization
newNameMorphOn: aComponent 
	"Answer a new morph on the name of aComponent."
	| result |
	result := UpdatingMenuStringMorph new.
	result useStringFormat; target: aComponent; getSelector: #name; putSelector: #name:; menuTarget: self selector: #addListMenuItems:for: arguments: {aComponent}; setNameTo: 'name'; setBalloonText: 'Click to enter a new name for this ', self componentName, ', or right click to get a menu.'.
	^ result