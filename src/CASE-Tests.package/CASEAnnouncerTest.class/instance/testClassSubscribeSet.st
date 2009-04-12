class tests
testClassSubscribeSet
	"Modeled on AnnouncerTest>>testSubscribeSet."
	| announcer announcement instance |
	
	announcer := self targetClass.
	announcer
		subscribe: AnnouncementMockA , AnnouncementMockC
		do: [ :ann | announcement := ann ].
	self remember: self listensTo: announcer.
		
	announcement := nil.
	instance := announcer announce: AnnouncementMockA.
	self assert: announcement = instance.
	
	announcement := nil.
	instance := announcer announce: AnnouncementMockB.
	self assert: announcement isNil.
	
	announcement := nil.
	instance := announcer announce: AnnouncementMockC.
	self assert: announcement = instance.
	
