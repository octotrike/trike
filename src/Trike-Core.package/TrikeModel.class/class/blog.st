examples
blog
	"Answer an instance of me which contains a threat model of  
	Blog 1.0."
	| result anonymous user admin account blog entry child rule externalAsset |
	result := self named: 'blog'.
	
	"Actors"
	anonymous := result addActorNamed: 'Anonymous'.
	anonymous 
		notes: 'Any user on the Internet.  Anonymous people are completely untrusted.';
	 	risk: 5.
	user := result addActorNamed: 'User'.
	user
		notes: 'Someone with a Blog.  Users are trusted more than Anonymous because they have been approved by an Admin.';
		risk: 4.
	admin := result addActorNamed: 'Admin'.
	admin
		notes: 'A specially designated User with power to administer portions of the system.';
		risk: 1.
	
	"Assets"
	externalAsset := result assets only.
	externalAsset value: 5000.
	account := result addAssetNamed: 'User Account'.
	account
		notes: 'Data about a User, such as name and password, which represents their account in the system.';
		value: 100.
	blog := result addAssetNamed: 'Blog'.
	blog
		notes: 'A User''s Blog.  Each Blog contains approximately 15 entries.';
		value: 75.
	entry := result addAssetNamed: 'Blog Entry'.
	entry
		notes: 'An individual entry in a User''s Blog.  The value is the cost of one month of service.';
		value: 5.

	result assets do: [:asset |
		asset actions do: [:action |
			action applyRuleToAllActors]].
	
	"Intended actions"
	rule := TrikeAndRule withSimplifiedChildren: {
		TrikeActorRule actor: anonymous.
		TrikeTextRule named:  'It is possible to determine later which source IP address created this User Account'.
		TrikeTextRule named:  'It is possible to determine later when this User Account was created'}.
	(account actionAt: #create) rule: rule; intended: true.
	child := TrikeAndRule withSimplifiedChildren: {
		TrikeActorRule actor: user.
		 TrikeTextRule named: 'It is Actor''s own User Account'}.
	rule := TrikeOrRule withSimplifiedChildren: {
		TrikeActorRule actor: admin.
		child}.
	(account actionAt: #read) rule: rule; intended: true.
	child := TrikeOrRule withSimplifiedChildren: {
		TrikeActorRule actor: user.
		TrikeActorRule actor: admin}.
	rule := TrikeAndRule withSimplifiedChildren: {
		child.
		TrikeTextRule named: 'It is Actor''s own User Account'}.
	(account actionAt: #update) rule: rule; intended: true.
	rule := TrikeAndRule withSimplifiedChildren: {
		TrikeActorRule actor: admin.
		TrikeTextRule named:  'Associated Blog, if any, is also legally deleted'}.
	(account actionAt: #delete) rule: rule; intended: true.

	rule := TrikeAndRule withSimplifiedChildren: {
		TrikeActorRule actor: admin.
		TrikeTextRule named:  'One Blog per User Account'}.
	(blog actionAt: #create) rule: rule; intended: true.
	(blog actionAt: #read) rule: nil; intended: true.
	child := TrikeOrRule withSimplifiedChildren: {
		TrikeActorRule actor: user.
		TrikeActorRule actor: admin}.
	rule := TrikeAndRule withSimplifiedChildren: {
		child.
		TrikeTextRule named: 'Actor is legally adding a Blog Entry'}.
	(blog actionAt: #update) rule: rule; intended: true.
	rule := TrikeAndRule withSimplifiedChildren: {
		TrikeActorRule actor: admin.
		TrikeTextRule named: 'Associated Blog Entries are also deleted'.
		TrikeTextRule named: 'Associated User Account is also deleted'.
		TrikeTextRule named: 'It is possible to determine later which Admin deleted this Blog'.
		TrikeTextRule named: 'It is possible to determine later when this Blog was deleted'.
		TrikeTextRule named: 'Admin must select a reason'}.
	(blog actionAt: #delete) rule: rule; intended: true.
	
	child := TrikeOrRule withSimplifiedChildren: {
		TrikeActorRule actor: user.
		TrikeActorRule actor: admin}.
	rule := TrikeAndRule withSimplifiedChildren: {
		child.
		TrikeTextRule named: 'One new Blog Entry per day'.
		TrikeTextRule named: 'Blog Entry is created in Actor''s own Blog'}.
	(entry actionAt: #create) rule: rule; intended: true.
	(entry actionAt: #read) rule: nil; intended: true.
	rule := TrikeAndRule withSimplifiedChildren: {
		TrikeTextRule named: 'Blog is being deleted'.
		TrikeActorRule actor: admin}.
	(entry actionAt: #delete) rule: rule; intended: true.
	
	"Threat-specific risk"
	externalAsset attacks do: [:attack |
		attack riskFactor: 5].
	^result