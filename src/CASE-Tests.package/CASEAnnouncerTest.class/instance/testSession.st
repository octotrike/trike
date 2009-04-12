instance tests
testSession
	"Confirm that an instance of my target class can find a session."
	| announcer |
	
	announcer := self targetClass new.
	self shouldnt: [announcer session isNil].
