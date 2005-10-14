initialization
initialize
	"Set my defaults. If I am currenty empty, also add my initial  
	submorphs."
	super initialize.
	self changeGridLayout; changeListDirection: #leftToRight; hResizing: #shrinkWrap; vResizing: #shrinkWrap; cellInset: 2; beSticky.
	submorphs
		ifEmpty: [self addLabel]