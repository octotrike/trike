class tests
testClassSession
	"Confirm that my target class can find a session."

	self shouldnt: [self targetClass session isNil].
