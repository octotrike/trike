initialization
buildGrid
	"Create morphs for my grid."
	| colorKey |
	grid := self gridMorphClass model: model.
	colorKey := grid colorKeyMorph.
	colorKey fullBounds; beSticky.
	self addPage.
	currentPage setNameTo: 'grid';
		 dropEnabled: false;
		
		addMorph: grid
		fullFrame: (LayoutFrame
				fractions: (0 @ 0 corner: 1 @ 1));
		
		addMorph: colorKey
		fullFrame: (LayoutFrame
				fractions: (1 @ 1 corner: 1 @ 1)
				offsets: (0 - colorKey width @ (0 - colorKey height) corner: 0 @ 0));
		 changeProportionalLayout