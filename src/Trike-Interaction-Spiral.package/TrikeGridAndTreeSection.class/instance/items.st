accessing
items
	"Answer my model's items, wrapped."
	| items |
	items := model perform: self modelContentsSelector.
	^ items
		ifNotNil: [items
				collect: [:item | item perform: self itemWrapperSelector]]