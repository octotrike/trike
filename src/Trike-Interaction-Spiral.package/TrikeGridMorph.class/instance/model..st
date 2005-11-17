accessing
model: anObject 
	"Set my model."
	model = anObject ifTrue: [^self].
	self unregisterForEvents.
	model := anObject.
	self removeAllMorphs; addLabel; addColumns; addRows; registerForEvents