layout
bounds: aRectangle
	| size |
	size _ aRectangle width max: aRectangle height.
	super bounds: (Rectangle center: aRectangle origin extent: size @ size).