initialization
buildTree
	"Create morphs for my tree."
	| tree |
	tree := EditableHierarchicalListMorph
				on: self
				list: #items
				selected: #currentTreeItem
				changeSelected: #currentTreeItem:
				menu: #addTreeMenuItems:
				keystroke: nil.
	tree borderWidth: 0;
		 setNameTo: self defaultName , ' tree'.
	self addPage.
	currentPage setNameTo: 'tree';
		dropEnabled: false;
		addMorph: tree
		fullFrame: (LayoutFrame
				fractions: (0 @ 0 corner: 1.0 @ 1.0));
		 changeProportionalLayout