accessing
model: aModel 
	"Set my model variable and any dependency relationships."
	model = aModel
		ifTrue: [^ self].
	self unregisterForEvents.
	model := aModel.
	self removeEverything.
	model
		ifNotNil: [self buildPages; triggerEvent: #sectionNavigationActions; goToPage: self defaultPage
			"This is here to get around an updating bug for section
			names. "].
	self registerForEvents