accessing
addAssetNamed: aString 
	"Create a new system asset named aString."
	(aString = TrikeAsset newComponentString  or: [aString = ''])
		ifFalse: [^ self
				addAsset: (TrikeAsset named: aString in: self)]