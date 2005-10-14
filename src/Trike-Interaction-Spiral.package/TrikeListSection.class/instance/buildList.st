initialization
buildList
	"Create a list view of my model's contents."

	self addPage.
	currentPage
		dropEnabled: false;
		setNameTo: 'list'.
	listMorph := AlignmentMorph new.
	listMorph
		changeGridLayout;
		beTransparent;
		beSticky;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		cellInset: 2;
		changeListDirection: #leftToRight;
		columnCount: self columnConstructorSelectors size.
	self buildLabels.
	self buildComponentCreator.
	(model perform: self modelContentsSelector) 
		do: [:component | self buildComponentMorphs: component].
	currentPage addMorph: listMorph.
	listMorph align: listMorph topLeft with: currentPage topLeft