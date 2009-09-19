Each of my instances is a model of a system, typically a software system, with an emphasis on interesting security events for the system in question.  I implement v1 of the Trike threat modeling methodology; see http://www.hhhh.org/trike/ for more information. 

Instance variables:

name		a String containing the name of the system I model
	
	Requirements model:
assets		a Collection of TrikeAssets for the system I model
actors		a Collection of TrikeActors which represent roles in the system I model
						
Intended actions, rules for when they should occur, and threats are the responsibility of assets; see TrikeAsset class comment for more information.
	
Dependents of one of my instances will receive the following messages:

update: #name 									"my name changed"
update: #anActor with: actorJustAdded		"the specified actor was added"
update: #noActor with: actorJustRemoved		"the specified actor was removed"
update: #anAsset with: assetJustAdded		"the specified asset was added"
update: #noAsset with: assetJustRemoved		"the specified asset was removed"

	with help from TrikeActor:
update: #actors									"my actors may have changed sort order"

	with help from TrikeAsset:
update: #assets									"my assets may have changed sort order"
update: #anAction with: actionJustAdded		"the specified action was added"
update: #noAction with: actionJustRemoved	"the specified action was removed"
update: #actions									"my actions may have changed sort order"
update: #anAttack with: attackJustAdded		"the specified attack was added"
update: #noAttack with: attackJustRemoved	"the specified attack was removed"

	with help from TrikeThreat:
update: #attacks									"my attacks may have changed sort order"

