versioning
version
	"Check and answer my version."
	| version |
	self
		assert: [self methodologyVersion = TrikeModel methodologyVersion]
		failureMessage: 'Methodology version mismatch';
		
		assert: [self nativeFileFormatVersion = TrikeModel nativeFileFormatVersion]
		failureMessage: 'File format version mismatch';
		
		assert: [self expectedModelPatchLevel = TrikeModel patchLevel]
		failureMessage: 'Model patch level mismatch'.
	version := '{1}.{2}.{3}' format: {self methodologyVersion. self nativeFileFormatVersion. self interfaceVersion}.
	self patchLevel > 0
		ifTrue: [version := '{1}.{2}' format: {version. self patchLevel}].
	version := '{1}{2}{3}' format: {version. self releaseType. self isDevelopmentVersion
					ifTrue: ['-dev']
					ifFalse: ['']}.
	^ version