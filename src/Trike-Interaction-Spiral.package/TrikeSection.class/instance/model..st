accessing
model: aModel 
	"Set my model variable and any dependency relationships."

	model = aModel ifTrue: [^self].
	self unregisterForEvents.
	model := aModel.
	self removeEverything.
	model ifNotNil: 
			[self
				buildPages;
				"This is here to get around an updating bug for section names."
				triggerEvent: #sectionNavigationOperations;
				goToPage: self defaultPage].
	self registerForEvents