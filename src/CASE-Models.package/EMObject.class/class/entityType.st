meta entity model
entityType
	"Answer an instance of EMEntityType which represents me, for use in a meta entity model."
	
	| entity |
	entity := self entityTypeClass designated: self name asString.
	entity description: self description.
	self attributeTypes do: [:attribute | entity addAttribute: attribute].
	^entity