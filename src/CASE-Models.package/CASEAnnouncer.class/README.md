I am an abstract Announcer class.   I implement Session-aware Announcer functionality for the CASE Framework.  
	- My instances and I can each retrieve an appropriate Session.
	- When an instance of me announces an isAboutTo change, 
		- it signals NoTransaction if there is no active transaction and
		- it queues this change asChangedAnnouncement in its Session, for reannouncement by my instance after the transaction is committed.
	- When an instance of me announces a change that has already occurred, it signals IsTransaction if there is an active transaction.
	- I wrap a per-class instance of myself, with the addition that when my subclass announces something that shouldBePassedUp, every superclass in the class hierarchy up to me announces the same thing.

Class Announcements
	AboutToCreateInstance, CreatedInstance


For license see https://github.com/octotrike/trike-core/blob/master/LICENSE.
