construction
addLabel
	"Create and add a Morph for the label in my upper left corner."
	| columnString label gridMorph columnLabel columnWidthOffset columnCenter rowString rowCenter w |
	w := self labelWidth.
	columnString := TTSampleStringMorph font: self defaultFont.
	columnString color: Color black;
		 borderWidth: 0;
		 string: self columnLabelString;
		 extent: (w * 0.6) @ (w * 0.15).
	columnLabel := TransformationMorph new.
	columnLabel rotationDegrees: -90;
		 addMorph: columnString.
	columnWidthOffset := columnLabel width / 2.
	rowString := TTSampleStringMorph font: self defaultFont.
	rowString color: Color black;
		 borderWidth: 0;
		 string: self rowLabelString;
		 extent: (w * 0.6) @ (w * 0.15).
	gridMorph := self crudMorph: w * 0.65.
	label := Morph new.
	label 
		width: w; 
		height: w;
		color: Color transparent;
		addMorph: columnLabel.
	columnCenter := (label rightCenter - (columnWidthOffset @ 0)) asPoint.
	columnLabel center: columnCenter.
	label addMorph: rowString.
	rowCenter := (label bottomCenter - (0 @ columnWidthOffset)) asPoint.
	rowString center: rowCenter.
	label addMorph: gridMorph.
	gridMorph center: (w * 0.325) @ (w * 0.325).
	self addMorph: label.
	self rowCount: 1.
	self columnCount: 1
	
