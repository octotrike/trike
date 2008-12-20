initialization
setPreferences
	"Make #Postpone the first issueResolutionStrategy."
	
	| issueResolutionStrategy |
	issueResolutionStrategy := PluggableListModel on: (Preferences preferenceAt: #issueResolutionStrategy) list: #preferenceValue.
	issueResolutionStrategy setListSelector: #preferenceValue:.
	issueResolutionStrategy move: #Postpone to: 1.
	