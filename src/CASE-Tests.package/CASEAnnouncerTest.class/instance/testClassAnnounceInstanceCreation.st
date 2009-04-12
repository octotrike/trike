class tests
testClassAnnounceInstanceCreation
	| targetClass announcer spy instance raisedAbort |

	targetClass := self targetClass.
	announcer := targetClass.
	self session: announcer session.
	spy := self spyOn: announcer.
	
	"If instance creation is successful, announce AboutToCreateInstance, then CreatedInstance."
	instance := targetClass new.
	self shouldnt: [instance isNil].
	self should: [spy announcements size = 2].
	self confirm: spy announcements first isKindOf: CASEAboutToCreateInstance on: targetClass with: instance.
	self confirm: spy announcements second isKindOf: CASECreatedInstance on: targetClass with: instance.

	spy clear.
	raisedAbort := false.
	instance := nil.
	
	"If instance creation is aborted, announce AboutToCreateInstance, but not CreatedInstance."
	announcer on: CASEAboutToCreateInstance send: #signal to: CASEAbortTransaction.
	self remember: CASEAbortTransaction listensTo: announcer.
	[instance := targetClass new] on: CASEAbortTransaction do: [
		raisedAbort := true. 
		self abort].
	self should: [raisedAbort = true].
	self should: [instance isNil].
	self should: [spy announcements only isKindOf: CASEAboutToCreateInstance].
	self should: [spy announcements only subject == targetClass].
	self should: [spy announcements only object class == targetClass].
	