meta entity model
addSubclassConnectionsTo: model
	"Add appropriate connections for my subclasses to the given meta entity model."
	
	| entity entities  |
	entity := model objectNamed: self name asString.
	entities := self subclasses collect: [:class | 
		model objectNamed: class name asString].
	entities ifNotEmpty: [ | connection |
		connection := EMClassificationRelationship from: entity to: entities.
		model addConnection: connection].
	
	
