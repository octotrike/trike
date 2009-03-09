An instance of me represents a situation in which more than one component of a model (or parent component) has the same label even though the model requires unique component labels.  Instances of me are automatically created when the situation first occurs, and automatically resolved when the situation ceases to exist.

Instance Variables
	components		a Collection of Components, all of which have the same parent and the same label

Announcements

My class subscribes to these announcements:
	AboutToChangeLabel
	AboutToAddComponent




For license see https://github.com/octotrike/trike-core/blob/master/LICENSE.
