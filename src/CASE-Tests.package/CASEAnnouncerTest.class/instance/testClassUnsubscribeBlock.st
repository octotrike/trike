class tests
testClassUnsubscribeBlock
	"Modeled on AnnouncerTest>>testUnsubscribeBlock."
	| announcer announcement |
	
	announcer := self targetClass.
	announcer
		subscribe: AnnouncementMockA
		do: [ :ann | announcement := ann ].
	announcer
		unsubscribe: self.

	announcement := nil.
	announcer announce: AnnouncementMockA new.
	self assert: announcement isNil