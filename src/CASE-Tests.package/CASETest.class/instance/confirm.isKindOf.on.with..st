accessing
confirm: aCollectionChange isKindOf: announcementClass on: aSubject with: anObject 
	"Shortcut method to check out characteristics of aCollectionChange."
	self should: [ aCollectionChange isKindOf: announcementClass ].
	self should: [ aCollectionChange subject == aSubject ].
	self should: [ aCollectionChange object == anObject ]