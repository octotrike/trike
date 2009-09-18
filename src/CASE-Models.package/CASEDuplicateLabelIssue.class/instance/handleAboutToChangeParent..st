event handling
handleAboutToChangeParent: anAnnouncement
	"If one of my components' parents is changing, remove it from me and check to see if it should be added to another issue."
	| component model newNamespace |

	component := anAnnouncement subject.
	model := anAnnouncement newValue.
	newNamespace := model namespaceOf: component.
	
	self remove: component.
	(self class check: model forDuplicatesLabeled: label in: newNamespace) ifFalse: [
		self class subscribeToNewComponent: component.
		self class subscribeToNonOrphanedComponent: component].
	
