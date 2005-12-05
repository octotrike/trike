accessing
model: aModel 
	"Set the model I am part of."
	model = aModel
		ifTrue: [^ self].
	self unregisterModelForEvents.
	model := aModel.
	self registerModelForEvents; triggerEvent: #model