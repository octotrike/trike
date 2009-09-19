examples
blog
	"Answer an instance of me which contains a threat model of 
	Blog 1.0."
	| result anonymous user admin account blog entry child rule externalAsset tmpAttack tmpAction |
	result := self named: 'Blog'.
	"Actors"
	anonymous := TrikeActor named: 'Anonymous' in: result.
	anonymous notes: 'Any user on the Internet.  Anonymous people are completely untrusted.';
		 risk: 5.
	user := TrikeActor named: 'User' in: result.
	user notes: 'Someone with a Blog.  Users are trusted more than Anonymous because they have been approved by an Admin.';
		 risk: 4.
	admin := TrikeActor named: 'Admin' in: result.
	admin notes: 'A specially designated User with power to administer portions of the system.';
		 risk: 1.
	"Assets"
	externalAsset := result assets only.
	externalAsset value: 5000.
	account := TrikeAsset named: 'User Account' in: result.
	account notes: 'Data about a User, such as name and password, which represents their account in the system.';
		 value: 100.
	blog := TrikeAsset named: 'Blog' in: result.
	blog notes: 'A User''s Blog.  Each Blog contains approximately 15 entries.';
		 value: 75.
	entry := TrikeAsset named: 'Blog Entry' in: result.
	entry notes: 'An individual entry in a User''s Blog.  The value is the cost of one month of service.';
		 value: 5.
	result assets
		do: [:asset | asset actions
				do: [:action | action applyRuleToAllActors]].
	"Intended actions"
	rule := TrikeAndRule withSimplifiedChildren: {TrikeActorRule actor: anonymous. TrikeTextRule named: 'It is possible to determine later which source IP address created this User Account'. TrikeTextRule named: 'It is possible to determine later when this User Account was created'}.
	(account actionAt: #Create) rule: rule;
		 intended: true.
	child := TrikeAndRule withSimplifiedChildren: {TrikeActorRule actor: user. TrikeTextRule named: 'It is Actor''s own User Account'}.
	rule := TrikeOrRule withSimplifiedChildren: {TrikeActorRule actor: admin. child}.
	(account actionAt: #Read) rule: rule;
		 intended: true.
	child := TrikeOrRule withSimplifiedChildren: {TrikeActorRule actor: user. TrikeActorRule actor: admin}.
	rule := TrikeAndRule withSimplifiedChildren: {child. TrikeTextRule named: 'It is Actor''s own User Account'}.
	(account actionAt: #Update) rule: rule;
		 intended: true.
	rule := TrikeAndRule withSimplifiedChildren: {TrikeActorRule actor: admin. TrikeTextRule named: 'Associated Blog, if any, is also legally deleted'}.
	(account actionAt: #Delete) rule: rule;
		 intended: true.
	rule := TrikeAndRule withSimplifiedChildren: {TrikeActorRule actor: admin. TrikeTextRule named: 'One Blog per User Account'}.
	(blog actionAt: #Create) rule: rule;
		 intended: true.
	(blog actionAt: #Read) rule: nil;
		 intended: true.
	child := TrikeOrRule withSimplifiedChildren: {TrikeActorRule actor: user. TrikeActorRule actor: admin}.
	rule := TrikeAndRule withSimplifiedChildren: {child. TrikeTextRule named: 'Actor is legally adding a Blog Entry'}.
	(blog actionAt: #Update) rule: rule;
		 intended: true.
	rule := TrikeAndRule withSimplifiedChildren: {TrikeActorRule actor: admin. TrikeTextRule named: 'Associated Blog Entries are also deleted'. TrikeTextRule named: 'Associated User Account is also deleted'. TrikeTextRule named: 'It is possible to determine later which Admin deleted this Blog'. TrikeTextRule named: 'It is possible to determine later when this Blog was deleted'. TrikeTextRule named: 'Admin must select a reason'}.
	(blog actionAt: #Delete) rule: rule;
		 intended: true.
	child := TrikeOrRule withSimplifiedChildren: {TrikeActorRule actor: user. TrikeActorRule actor: admin}.
	rule := TrikeAndRule withSimplifiedChildren: {child. TrikeTextRule named: 'One new Blog Entry per day'. TrikeTextRule named: 'Blog Entry is created in Actor''s own Blog'}.
	(entry actionAt: #Create) rule: rule;
		 intended: true.
	(entry actionAt: #Read) rule: nil;
		 intended: true.
	rule := TrikeAndRule withSimplifiedChildren: {TrikeTextRule named: 'Blog is being deleted'. TrikeActorRule actor: admin}.
	(entry actionAt: #Delete) rule: rule;
		 intended: true.
	"Threat-specific risk"
	"externalAsset"
	tmpAction := externalAsset actionAt: #Create.
	tmpAttack := tmpAction attackAt: TrikeDenialOfServiceThreat.
	tmpAttack riskFactor: 3.
	tmpAttack := tmpAction attackAt: TrikeElevationOfPrivilegeThreat.
	tmpAttack riskFactor: 5.
	tmpAction := externalAsset actionAt: #Read.
	tmpAttack := tmpAction attackAt: TrikeDenialOfServiceThreat.
	tmpAttack riskFactor: 3.
	tmpAttack := tmpAction attackAt: TrikeElevationOfPrivilegeThreat.
	tmpAttack riskFactor: 5.
	tmpAction := externalAsset actionAt: #Update.
	tmpAttack := tmpAction attackAt: TrikeDenialOfServiceThreat.
	tmpAttack riskFactor: 3.
	tmpAttack := tmpAction attackAt: TrikeElevationOfPrivilegeThreat.
	tmpAttack riskFactor: 5.
	tmpAction := externalAsset actionAt: #Delete.
	tmpAttack := tmpAction attackAt: TrikeDenialOfServiceThreat.
	tmpAttack riskFactor: 3.
	tmpAttack := tmpAction attackAt: TrikeElevationOfPrivilegeThreat.
	tmpAttack riskFactor: 5.
	"account"
	tmpAction := account actionAt: #Create.
	tmpAttack := tmpAction attackAt: TrikeDenialOfServiceThreat.
	tmpAttack riskFactor: 1.
	tmpAttack := tmpAction attackAt: TrikeElevationOfPrivilegeThreat.
	tmpAttack riskFactor: 2.
	tmpAction := account actionAt: #Read.
	tmpAttack := tmpAction attackAt: TrikeDenialOfServiceThreat.
	tmpAttack riskFactor: 1.
	tmpAttack := tmpAction attackAt: TrikeElevationOfPrivilegeThreat.
	tmpAttack riskFactor: 5.
	tmpAction := account actionAt: #Update.
	tmpAttack := tmpAction attackAt: TrikeDenialOfServiceThreat.
	tmpAttack riskFactor: 4.
	tmpAttack := tmpAction attackAt: TrikeElevationOfPrivilegeThreat.
	tmpAttack riskFactor: 4.
	tmpAction := account actionAt: #Delete.
	tmpAttack := tmpAction attackAt: TrikeDenialOfServiceThreat.
	tmpAttack riskFactor: 2.
	tmpAttack := tmpAction attackAt: TrikeElevationOfPrivilegeThreat.
	tmpAttack riskFactor: 3.
	"blog"
	tmpAction := blog actionAt: #Create.
	tmpAttack := tmpAction attackAt: TrikeDenialOfServiceThreat.
	tmpAttack riskFactor: 2.
	tmpAttack := tmpAction attackAt: TrikeElevationOfPrivilegeThreat.
	tmpAttack riskFactor: 5.
	tmpAction := blog actionAt: #Read.
	tmpAttack := tmpAction attackAt: TrikeDenialOfServiceThreat.
	tmpAttack riskFactor: 1.
	tmpAction := blog actionAt: #Update.
	tmpAttack := tmpAction attackAt: TrikeDenialOfServiceThreat.
	tmpAttack riskFactor: 3.
	tmpAttack := tmpAction attackAt: TrikeElevationOfPrivilegeThreat.
	tmpAttack riskFactor: 5.
	tmpAction := blog actionAt: #Delete.
	tmpAttack := tmpAction attackAt: TrikeDenialOfServiceThreat.
	tmpAttack riskFactor: 3.
	tmpAttack := tmpAction attackAt: TrikeElevationOfPrivilegeThreat.
	tmpAttack riskFactor: 4.
	"entry"
	tmpAction := entry actionAt: #Create.
	tmpAttack := tmpAction attackAt: TrikeDenialOfServiceThreat.
	tmpAttack riskFactor: 2.
	tmpAttack := tmpAction attackAt: TrikeElevationOfPrivilegeThreat.
	tmpAttack riskFactor: 5.
	tmpAction := entry actionAt: #Read.
	tmpAttack := tmpAction attackAt: TrikeDenialOfServiceThreat.
	tmpAttack riskFactor: 1.
	tmpAction := entry actionAt: #Update.
	tmpAttack := tmpAction attackAt: TrikeElevationOfPrivilegeThreat.
	tmpAttack riskFactor: 5.
	tmpAction := entry actionAt: #Delete.
	tmpAttack := tmpAction attackAt: TrikeDenialOfServiceThreat.
	tmpAttack riskFactor: 3.
	tmpAttack := tmpAction attackAt: TrikeElevationOfPrivilegeThreat.
	tmpAttack riskFactor: 4.
	^ result