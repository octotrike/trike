accessing
wrappedWithRules
	| result |
	result := EditableListItemWrapper with: self model: self.
	result getStringSelector: #name;
		 getContentsSelector: #wrappedRules;
		 hasContentsSelector: #hasRules.
	^ result