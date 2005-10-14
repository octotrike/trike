construction
addLabel
	"Create and add a Morph for the label in my upper left corner."
	| columnString label gridMorph crud columnLabel columnWidthOffset columnCenter rowString rowCenter |
	columnString := TTSampleStringMorph font: self defaultFont.
	columnString color: Color black;
		 borderWidth: 0;
		 string: self columnLabelString;
		 extent: 90 @ 22.
	columnLabel := TransformationMorph new.
	columnLabel rotationDegrees: -90;
		 addMorph: columnString.
	columnWidthOffset := columnLabel width / 2.
	rowString := TTSampleStringMorph font: self defaultFont.
	rowString color: Color black;
		 borderWidth: 0;
		 string: self rowLabelString;
		 extent: 90 @ 22.
	gridMorph := AlignmentMorph new.
	gridMorph beTransparent; changeGridLayout; changeListDirection: #leftToRight; hResizing: #shrinkWrap; vResizing: #shrinkWrap; cellPositioning: #topLeft; columnCount: 2; rowCount: nil.
	crud := OrderedCollection new.
	#('C' 'R' 'U' 'D' )
		do: [:letter | 
			| letterMorph | 
			letterMorph := TTSampleStringMorph font: self defaultFont.
			letterMorph color: Color black;
				 borderWidth: 0;
				 string: letter;
				 extent: 33 @ 33.
			crud add: letterMorph].
	gridMorph addAllMorphs: crud.
	label := Morph new.
	label width: self labelWidth.
	label height: self labelWidth.
	label color: Color transparent.
	label addMorph: columnLabel.
	columnCenter := (label rightCenter - (columnWidthOffset @ 0)) asPoint.
	columnLabel center: columnCenter.
	label addMorph: rowString.
	rowCenter := (label bottomCenter - (0 @ columnWidthOffset)) asPoint.
	rowString center: rowCenter.
	label addMorph: gridMorph.
	gridMorph center: label center - (10 @ 10).
	self addMorph: label.
	self rowCount: 1.
	self columnCount: 1