event handling
attacksChanged
	"Notify my model that my attacks have changed."
	model
		ifNotNil: [model triggerEvent: #attacks]