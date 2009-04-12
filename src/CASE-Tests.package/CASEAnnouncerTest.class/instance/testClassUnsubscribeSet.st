class tests
testClassUnsubscribeSet
	"Modeled on AnnouncerTest>>testUnsubscribeSet."
	| announcer announcement |
	
	announcer := self targetClass.
	announcer
		subscribe: AnnouncementMockA , AnnouncementMockB
		do: [ :ann | announcement := ann ].
	announcer
		unsubscribe: self.

	announcement := nil.
	announcer announce: AnnouncementMockA new.
	self assert: announcement isNil.
	
	announcement := nil.
	announcer announce: AnnouncementMockB new.
	self assert: announcement isNil.