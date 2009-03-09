accessing
description: aString 
	description = aString ifFalse: [
		self session commit: [
			description := aString]]