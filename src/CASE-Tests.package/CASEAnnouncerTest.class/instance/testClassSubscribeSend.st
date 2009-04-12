class tests
testClassSubscribeSend
	"Modeled on AnnouncerTest>>testSubscribeSend."
	| announcer announcement instance aBlock |
	
	announcer := self targetClass.
	aBlock := [ :ann | announcement := ann ].
	announcer
		subscribe: AnnouncementMockA
		send: #value:
		to: aBlock.
	self remember: aBlock listensTo: announcer.
		
	announcement := nil.
	instance := announcer announce: AnnouncementMockA.
	self assert: announcement = instance.
	
	announcement := nil.
	instance := announcer announce: AnnouncementMockB new.
	self assert: announcement isNil.
