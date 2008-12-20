accessing
identifier: attributeTypeSet
	"Set the Set of AttributeTypes whose values, taken together, can uniquely and unambiguously distinguish all instances of me."
	"Each AttributeType in attributeTypeSet must appear in my attributes."

	(attributes includesAllOf: attributeTypeSet) ifFalse: [
		EMException signal: 'proposed identifier is not a subset of attributes' ].
	identifier := attributeTypeSet