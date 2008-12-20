layout
layoutBounds: aRectangle
	| size |
	size _ aRectangle width max: aRectangle height.
	super layoutBounds: (Rectangle center: aRectangle origin extent: size @ size).