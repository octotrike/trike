event handling
editIntendedActionActions: parent 
	"Answer an OrderedCollection containing all operations  
	my instances support for editing intended actions."
	| result |
	result := OrderedCollection new.
	result
		add: self addRuleAction.
	rule ifNotNil: [result add: self alwaysAllowAction].
	result
		 add: self neverAllowAction.
	^ result