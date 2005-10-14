accessing
addRule: aRule

	rule
		ifNil: [self rule: aRule]
		ifNotNil: [
			self rule: (rule orWithoutSimplification: aRule)]