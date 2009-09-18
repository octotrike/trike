resolving
resolve: anIssue
	"Abort the current transaction, thereby undoing the change that caused this issue.  If successful, answer true.  If unsuccessful, answer false."
	
	anIssue abortWouldUndo
		ifTrue: [self needsWork.  "No undo support for issues that have already been committed." ^false]
		ifFalse: [CASEAbortTransaction signal: 'Undo to resolve conflict' with: anIssue]