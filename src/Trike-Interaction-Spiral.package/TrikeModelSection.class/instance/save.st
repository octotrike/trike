event handling
save
	| fileStream xmlDocument |
	(fileStream := StandardFileMenu newFileStream)
		ifNotNil: [
			xmlDocument := model convertToNativeXML.
			xmlDocument printOn: fileStream.
			fileStream close]
