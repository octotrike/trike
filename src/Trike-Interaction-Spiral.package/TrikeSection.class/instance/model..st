accessing
model: aModel 
	"Set my model variable, but don't set any dependency relationships.  
	My parent will pass on relevant updates."

	model := aModel.
	self removeEverything.
	model ifNotNil: 
			[self
				buildPages;
				changed: #sectionNavigationOperations;
				goToPage: self defaultPage
			"This is here to get around an updating bug for section names. "]