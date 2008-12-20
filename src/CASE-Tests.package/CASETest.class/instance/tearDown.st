release
tearDown
	"Restore system state external to me, after running a test which may have altered it."
	
	self restorePreferences
	
