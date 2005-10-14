construction
addRows
	"Create and add a new TextMorph for each row component in 
	the model, in the left column."
	(model perform: self rowContentsSelector)
		do: [:component | self addRow: component]