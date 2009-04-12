release
unsubscribeListeners
	"Unsubscribe any listeners I may have subscribed."
	
	listeners keysDo: [:announcer | 
		(listeners at: announcer) do: [:listener |
			announcer unsubscribe: listener]]