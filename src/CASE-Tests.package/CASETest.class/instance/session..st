accessing
session: aSession

	session ifNotNil: [
		self forgetRoots; initializeRoots].
	session := aSession.
	self shouldnt: [session inTransaction]
