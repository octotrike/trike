initialization
addOpenSection
	"Add a section which enables an analyst to open new models,
	or load models from files."
	| newPage |
	newPage := PasteUpMorph initializedInstance.
	newPage enableDrop: false;
		 extent: self pageSize;
		 color: self defaultPageColor;
		 borderWidth: 0;
		 setNameTo: 'Open'.
	self addPage: newPage.
	self goToPage: newPage