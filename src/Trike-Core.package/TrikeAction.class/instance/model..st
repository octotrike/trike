accessing
model: aModel 
	"Set the model I am part of."
	model = aModel
		ifTrue: [^ self].
	model := aModel.
	self triggerEvent: #model