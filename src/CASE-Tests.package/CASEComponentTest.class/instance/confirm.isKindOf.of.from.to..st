accessing
confirm: aValueChange isKindOf: announcementClass of: aSubject from: oldValue to: newValue
	"Shortcut method to check out characteristics of aValueChange."
	
	self should: [aValueChange isKindOf: announcementClass].
	self should: [aValueChange subject == aSubject].
	self should: [aValueChange oldValue == oldValue].
	self should: [aValueChange newValue == newValue].	