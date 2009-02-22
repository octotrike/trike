private
noBalanceRemoveImplication: anImplication
	"Remove anImplication from my implications."

	^implications remove: anImplication ifAbsent: [nil]