accessing
determinant: attributeTypeSet
	"Set the Set of AttributeTypes whose values, taken together, can uniquely and unambiguously distinguish all instances of me."
	"Each AttributeType in attributeTypeSet must be one of my attributes."

	(self attributes includesAllOf: attributeTypeSet) ifFalse: [
		EMInconsistency signal: 'proposed identifier is not a subset of attributes' ].
	determinant := attributeTypeSet