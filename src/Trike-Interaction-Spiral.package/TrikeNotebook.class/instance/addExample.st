initialization
addExample
	"Add a sample assessment."
	
	| blog newPage |
	blog := TrikeModel blog.
	newPage := TrikeModelSection on: blog.
	newPage extent: self pageSize;
		 color: self defaultPageColor;
		borderWidth: 0;
		setNameTo: blog name.
	self addPage: newPage.
	self goToPage: newPage