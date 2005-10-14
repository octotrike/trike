initialization
addAboutSection
	"Add a section that is all about Trike. Whoo hoo!"
	| newPage logo |
	newPage := PasteUpMorph initializedInstance.
	logo := self class trikeLogo.
	self resetHeightCounter.
	newPage enableDrop: false;
		extent: self pageSize;
		 color: self defaultPageColor;
		 borderWidth: 0;
		 setNameTo: 'about';
		
		addMorph: self releaseMorph;
		addMorph: self urlMorph;
		addMorph: logo
		fullFrame: (self layoutFrameFor: logo);
		
		addMorph: self creditMorph;
		 changeProportionalLayout.
	self addPage: newPage