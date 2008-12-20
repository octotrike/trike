meta entity model
setDeterminantIn: model
	"Add my determinant to the entity that represents me in the given meta entity model."
	
	| entity determinants |
	entity := model objectNamed: self name asString.
	determinants := (self determinantObjectClasses collect: [:class | 
		model objectNamed: class name asString]) asOrderedCollection.
	determinants addAll: (self determinantAttributeNames collect: [:attribute | 
		entity attributeNamed: attribute]).
	entity determinant: determinants