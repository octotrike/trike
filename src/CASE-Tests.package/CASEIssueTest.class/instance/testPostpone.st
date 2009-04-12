running
testPostpone
	| i a iSpy aSpy |
	i := self componentClass labeled: 'cog'.
	a := self targetClass on: {i}.
	iSpy := self spyOn: i.
	aSpy := self spyOn: a.
	self addAll: {i. a}.
	
	"When an issue is postponed, it should still be active and nothing should be announced."
	a postpone.
	self should: [a isActive].
	self should: [aSpy announcements isEmpty].
	self should: [iSpy announcements isEmpty].

