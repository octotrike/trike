event handling
wrapped
	| result |
	result := EditableListItemWrapper with: self model: self.
	result getStringSelector: #name;
		 getContentsSelector: #wrappedChildren;
		 hasContentsSelector: #hasChildren.
	^ result