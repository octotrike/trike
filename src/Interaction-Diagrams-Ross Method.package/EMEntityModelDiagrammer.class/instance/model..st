accessing
model: entityModel
	"Set my model, and draw it on my pasteUp."
	 
	model = entityModel ifTrue: [^self].
	model ifNotNil: [self removeAll].
	model := entityModel.
	model ifNotNil: [self addAll].
