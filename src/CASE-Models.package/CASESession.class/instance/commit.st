transactions
commit
	[session commit] on: MaError do: [
		reannouncementQueue := self newReannouncementQueue. 
		^self].
	reannouncementQueue do: [:announcement |
		announcement subject announce: announcement asChangedAnnouncement].
	reannouncementQueue := self newReannouncementQueue.