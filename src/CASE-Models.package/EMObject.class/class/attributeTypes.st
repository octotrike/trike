meta entity model
attributeTypes
	"Answer a Set of EMAttributeTypes which represent my attributes, for use in a meta entity model."
	
	| names |
	names := Set new.
	names
		addAll: self determinantAttributeNames;
		addAll: self nonDeterminantAttributeNames.
	^names
		collect: [:variableName | (EMAttributeType designated: variableName)]