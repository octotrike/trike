initialization
initialize
	"Set my defaults. If I am currenty empty, also add my initial  
	submorphs."
	super initialize.
	self changeGridLayout; changeListDirection: #leftToRight; hResizing: #shrinkWrap; vResizing: #shrinkWrap; cellInset: 2; beSticky; layoutInset: 0; borderWidth: 0.
	submorphs
		ifEmpty: [self addLabel]