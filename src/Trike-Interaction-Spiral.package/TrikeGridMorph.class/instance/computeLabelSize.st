accessing
computeLabelSize
	"Set labelWidth and defaultLabelHeight, in pixels, for the current value of labelFont."

	| label |
	label := TextMorph new.
	label contents: 'a'.
	"'internationalization' is a long word; it has no other significance"
	label 
		contentsAsIs: ('internationalization' , String cr , 'internationalization') 
				asText.
	labelWidth := label width