event handling
wrappedWithParent: anObject
	| result |
	result := EditableListItemWrapper with: anObject model: self.
	result getStringSelector: #name;
		 getContentsSelector: #wrappedChildren;
		 hasContentsSelector: #hasChildren.
	^ result