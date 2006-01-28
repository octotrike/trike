initialization
buildTree
	"Create morphs for my tree."
	tree := EditableHierarchicalListMorph
				on: self
				list: #items
				selected: #currentTreeItem
				changeSelected: #currentTreeItem:
				menu: #addTreeMenuItems:
				keystroke: nil.
	tree borderWidth: 0;
		 setNameTo: self defaultName , ' Tree'.
	self addPage.
	currentPage setNameTo: 'Tree';
		 dropEnabled: false;
		
		addMorph: tree
		fullFrame: (LayoutFrame
				fractions: (0 @ 0 corner: 1.0 @ 1.0));
		 changeProportionalLayout