transactions
commit
	[session commit] on: MaError do: [reannouncementQueue := OrderedCollection new].
	reannouncementQueue do: [:announcement |
		announcement commit.
		self announce: announcement]