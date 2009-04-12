testing
isAboutTo
	"Answer whether my instances are AboutTo announcements."
	
	^((self name findString: 'AboutTo') = 0) not
		