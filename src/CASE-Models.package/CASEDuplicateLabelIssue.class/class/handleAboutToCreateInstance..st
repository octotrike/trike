event handling
handleAboutToCreateInstance: anAnnouncement
	"Listen for announcements from a new instance of Component."

	self subscribeToNewComponent: anAnnouncement object
	