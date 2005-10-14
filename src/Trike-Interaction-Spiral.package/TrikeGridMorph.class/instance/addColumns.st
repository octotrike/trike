construction
addColumns
	"Create and add a new TextMorph for each column component 
	in the model, in the top row."
	(model perform: self columnContentsSelector)
		do: [:component | self addColumn: component]