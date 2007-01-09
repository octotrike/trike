layout
extent: aPoint
	| size |
	size _ aPoint x max: aPoint y.
	super extent: size @ size.