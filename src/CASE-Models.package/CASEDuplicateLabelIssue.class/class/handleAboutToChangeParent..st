event handling
handleAboutToChangeParent: anAnnouncement
	"Decide if an instance of myself is implied.  If it isn't, adjust what I'm listening for."
	| component model namespace label |

	component := anAnnouncement subject.
	model := anAnnouncement newValue.
	namespace := model namespaceOf: component.
	label := component label.
	
	model 
		ifNil: [
			component unsubscribe: self.
			self subscribeToNewComponent: component]
		ifNotNil: [
			(self check: model forDuplicatesLabeled: component label in: namespace) ifFalse: [
				anAnnouncement oldValue ifNil: [
					self subscribeToNonOrphanedComponent: component]]].
	
	
	 