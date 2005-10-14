event handling
addRuleOfClass: aRuleClass with: constrainingObject as: childOrSibling

	| newRule |
	newRule := aRuleClass perform: aRuleClass constrainedInstanceSelector with: constrainingObject.
	self addRule: newRule as: childOrSibling