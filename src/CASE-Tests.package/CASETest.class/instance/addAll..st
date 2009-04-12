accessing
addAll: aCollection
	"Add aCollection to my roots."
	
	roots addAll: aCollection.
	self session addAll: aCollection