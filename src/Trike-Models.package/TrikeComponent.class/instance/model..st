accessing
model: aModel
	"Set the model I am part of."
	model = aModel ifTrue: [^self].
	model ifNotNil: [model perform: self class modelRemoveComponentSelector with: self].
	model := aModel.
	(model notNil and: [((model perform: self class modelContentsSelector) includes: self) not]) ifTrue: [
		model perform: self class modelAddComponentSelector with: self].
	self triggerEvent: #model
	