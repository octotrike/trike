accessing
replaceTextMorph: oldMorph with: newMorph
	oldMorph owner
		replaceSubmorph: oldMorph by: newMorph;
		changed;
		layoutChanged.
	self layoutChanged; adjustLayoutBounds