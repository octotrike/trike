accessing
disableProgrammerFacilities
	"Warning: do not call this lightly!  It disables all access to menus, debuggers, halos.  There is no guaranteed return from this, which is to say, you cannot necessarily reenable these things once they are disabled -- you can only use whatever the UI of the current project affords, and you cannot even snapshot -- you can only quit. 

     You can completely reverse the work of this method by calling the dual Preferences method enableProgrammerFacilities, provided you have left yourself leeway to bring about a call to that method."

	Preferences disable: #cmdDotEnabled.       "No user-interrupt-into-debugger"

	Preferences disable: #cmdGesturesEnabled.  "No halos, etc."

	Preferences disable: #cmdKeysInText.    "No user commands invokable via cmd-key combos in text editor"

	Preferences enable: #noviceMode.           "No control-menu"
	Preferences disable: #warnIfNoSourcesFile.
	Preferences disable: #warnIfNoChangesFile.
	Preferences enable: #eToyFriendly. "No world menu, simple debug notifier, "
	Preferences disable: #honorDesktopCmdKeys.
	Preferences enable: #appendToErrorLog.
	Preferences enable: #noDebugButton.
	Preferences disable: #readDocumentAtStartup.