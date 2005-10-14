event handling
update: anAspect
	"AnAspect of something I care about has changed.  Update myself accordingly."

	anAspect = #inScope ifTrue: [
		asset inScope
			ifTrue: [
				self
					intended: false;
					rule: nil]
			ifFalse: [
				self
					intended: true;
					rule: TrikeTextRule initializedInstance]].
	anAspect = #model ifTrue: [
		self model: asset model].
	super update: anAspect