class tests
testClassSubscribeSubclass
	"Modeled on AnnouncerTest>>testSubscribeSubclass."
	| announcer announcement instance |
	
	announcer := self targetClass.
	announcer
		subscribe: AnnouncementMockB
		do: [ :ann | announcement := ann ].
	self remember: self listensTo: announcer.
		
	announcement := nil.
	instance := announcer announce: AnnouncementMockA.
	self assert: announcement isNil.

	announcement := nil.
	instance := announcer announce: AnnouncementMockB.
	self assert: announcement = instance.
	
	announcement := nil.
	instance := announcer announce: AnnouncementMockC.
	self assert: announcement = instance.

