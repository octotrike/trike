event handling
registerForEvents
	"Register for events from my model."
	
	super registerForEvents.
	model ifNil: [^self].
	self componentAddSymbol
		ifNotNil: [model when: self componentAddSymbol send: #buildComponentMorphs: to: self].
	self componentRemoveSymbol
		ifNotNil: [model when: self componentRemoveSymbol send: #removeComponentMorphs: to: self].
		