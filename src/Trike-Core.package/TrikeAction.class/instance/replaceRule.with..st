accessing
replaceRule: oldRule with: newRule 
	"Replace oldRule with newRule."
	rule == oldRule
		ifTrue: [self rule: newRule]
		ifFalse: [self error: 'Cannot replace nonexistent rule']