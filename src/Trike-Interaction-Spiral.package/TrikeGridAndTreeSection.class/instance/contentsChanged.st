event handling
contentsChanged
	"Something about my model's contents, typically the order,
	has changed. There is duplicate updating here in most
	situations to avoid pathological caching -- debug properly later."
	tree update: #items;
		 update: #currentTreeItem;
		 setSelectionIndex: tree getSelectionIndex