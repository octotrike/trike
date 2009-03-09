announce
reannounce
	"Announce committed versions of all the AboutTo announcements issued during the transaction that was just committed, and clear reannouncementQueue to prepare for the next transaction."
	
	reannouncementQueue do: [:announcement |
		announcement subject announce: announcement asChangedAnnouncement].
	reannouncementQueue := self newReannouncementQueue.