class tests
testClassOnDo
	"Modeled on AnnouncerTest>>testSubscribeBlock."
	| announcer announcement instance |
	
	announcer := self targetClass.
	announcer
		on: AnnouncementMockA
		do: [ :ann | announcement := ann ].
	self remember: self listensTo: announcer.
		
	announcement := nil.
	instance := announcer announce: AnnouncementMockA.
	self assert: announcement = instance.
	
	announcement := nil.
	instance := announcer announce: AnnouncementMockB.
	self assert: announcement isNil.
