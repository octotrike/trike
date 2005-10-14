initialization
buildLabels
	"Label my columns."

	listMorph rowCount: 1.
	self columnLabelStrings do: 
			[:label | 
			| morph |
			morph := StringMorph contents: label.
			listMorph addMorphBack: morph]