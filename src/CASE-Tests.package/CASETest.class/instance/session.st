accessing
session
	^session ifNil: [session := CASETestSession current session]