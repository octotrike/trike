accessing
namespaceOf: component
	"Answer the namespace of a component that is already part of me."

	components keysAndValuesDo: [:namespace :contents |
		(contents includes: component) ifTrue: [^namespace]].	
	^nil