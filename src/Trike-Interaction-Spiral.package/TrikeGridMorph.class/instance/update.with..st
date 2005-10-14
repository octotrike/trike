event handling
update: anAspect with: aParameter 
	"AnAspect of an object I depend on has changed. Update  
	myself accordingly."
	(self interestingAspects includes: anAspect)
		ifTrue: [| rowNumber | 
			rowNumber := self findRowForComponent: aParameter asset.
			2 to: self columnCount do: [:columnNumber | | intersection |
				intersection := submorphs
					at: (self layoutPolicy indexFromGridSquare: columnNumber @ rowNumber horizontal: true).
				intersection submorphs do: [:submorph |
					submorph update: anAspect with: aParameter]]].
	super update: anAspect with: aParameter