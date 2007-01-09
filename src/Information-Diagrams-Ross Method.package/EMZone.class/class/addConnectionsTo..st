meta entity model
addConnectionsTo: model 
	"Add appropriate connections for me to the given meta entity model."
	
	| entity |
	entity := model objectNamed: self name asString.
	{ EMAggregateObjectType. EMAlias. EMConnection. EMEntityType } do: [:class | | object connection |
		object := model objectNamed: class name asString.
		connection := EMRelationship from: entity to: object.
		connection
			designated: 'contains';
			subjectMinimum: 1;
			subjectMaximum: 1.
		model addConnection: connection].
	