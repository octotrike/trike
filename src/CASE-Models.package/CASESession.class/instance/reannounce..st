announce
reannounce: aChangeAnnouncement
	"Queue aChangeAnnouncement up for reannouncement after changes have been committed."
	
	reannouncementQueue addLast: aChangeAnnouncement.
