event handling
addYellowMenuItems: aMenu
	"Add appropriate menu items to my yellow button menu."
	
	aMenu add: 'save' target: self selector: #save:.
	aMenu add: 'save as...' target: self selector: #saveAs:.
	aMenu add: 'close' target: self selector: #close:.