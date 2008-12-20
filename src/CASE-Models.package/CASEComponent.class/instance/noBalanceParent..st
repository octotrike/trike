private
noBalanceParent: aModel
	"Set my container.  Always call noBalanceParent: before the other noBalance method you are going to call, so that if a duplicate label issue occurs, change notification will propagate up the new parent rather than the old."

	parent := aModel.
